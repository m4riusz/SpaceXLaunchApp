//
//  DependencyContainer.swift
//  SpaceXLaunchApp
//
//  Created by Mariusz Sut on 21/06/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation
import Swinject
import Moya
import RealmSwift

struct DependencyContainer {
    
    fileprivate static let container: Container = {
        return DependencyContainer.getContainer()
    }()
    
    fileprivate static func getContainer() -> Container {
        let container = Container()
        //MARK: LaunchList
        container.register(LaunchListViewModel.self) { _ in
            return LaunchListViewModel()
        }
        container.register(LaunchListController.self) { resolver in
            return LaunchListController(viewModel: resolver.resolve(LaunchListViewModel.self)!)
        }
        //MARK: NextLaunch
        container.register(NextLaunchViewModel.self) { resolver in
            return NextLaunchViewModel(launchRepository: resolver.resolve(LaunchRepositoryProtocol.self)!)
        }
        container.register(NextLaunchController.self) { resolver in
            return NextLaunchController(viewModel: resolver.resolve(NextLaunchViewModel.self)!)
        }
        //MARK: Info
        container.register(InfoViewModel.self) { resolver in
            return InfoViewModel()
        }
        container.register(InfoController.self) { resolver in
            return InfoController(viewModel: resolver.resolve(InfoViewModel.self)!)
        }
        //MARK: MoyaProvider
        container.register(MoyaProvider<SpaceXService>.self) { _ in
            return MoyaProvider<SpaceXService>(plugins: [NetworkLoggerPlugin(verbose: true)])
        }
        //MARK: Realm
        container.register(Realm.self) { resolver in
            return try! Realm(configuration: resolver.resolve(Realm.Configuration.self)!)
        }
        container.register(Realm.Configuration.self) { _ in
            var config = Realm.Configuration.defaultConfiguration
            config.schemaVersion = AppDefaults.realmSchemaVersion
            config.migrationBlock = { migration, oldSchemeVersion in
                
            }
            return config
        }.inObjectScope(.container)
        //MARK: LaunchRepositoryProtocol
        container.register(LaunchRepositoryProtocol.self) { resolver in
            return LaunchRepository(realm: resolver.resolve(Realm.self)!,
                                    provider: resolver.resolve(MoyaProvider<SpaceXService>.self)!)
        }
        return container
    }
    
    static func resolve<Service>(_ serviceType: Service.Type) -> Service {
        return DependencyContainer.container.resolve(serviceType)!
    }
    
    static func resolve<Service, Argument>(_ serviceType: Service.Type,
                                           _ argument: Argument) -> Service {
        return DependencyContainer.container.resolve(serviceType,
                                                     argument: argument)!
    }
}
