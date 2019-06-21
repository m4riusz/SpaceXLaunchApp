//
//  DependencyContainer.swift
//  SpaceXLaunchApp
//
//  Created by Mariusz Sut on 21/06/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation
import Swinject

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
        container.register(NextLaunchViewModel.self) { _ in
            return NextLaunchViewModel()
        }
        container.register(NextLaunchController.self) { resolver in
            return NextLaunchController(viewModel: resolver.resolve(NextLaunchViewModel.self)!)
        }
        return container
    }
    
    static func resolve<Service>(_ serviceType: Service.Type) -> Service {
        return DependencyContainer.container.resolve(serviceType)!
    }
    
    static func resolve<Service, Argument>(_ serviceType: Service.Type, _ argument: Argument) -> Service {
        return DependencyContainer.container.resolve(serviceType, argument: argument)!
    }
}
