//
//  LaunchRepository.swift
//  SpaceXLaunchApp
//
//  Created by Mariusz Sut on 22/06/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift
import Moya
import RxRealm

protocol LaunchRepositoryProtocol {
    func getNextLaunch() -> Observable<Launch>
    func refreshNextLaunch() -> Completable
}

struct LaunchRepository : LaunchRepositoryProtocol {
    
    fileprivate let realm: Realm
    fileprivate let provider: MoyaProvider<SpaceXService>
    
    init(realm: Realm, provider: MoyaProvider<SpaceXService>) {
        self.realm = realm
        self.provider = provider
    }
    
    func getNextLaunch() -> Observable<Launch> {
        let objects = self.realm.objects(RMLaunch.self)
        return Observable.array(from: objects)
            .flatMapLatest({ realmObjects -> Observable<Launch> in
                guard let first = realmObjects.first?.asDomain() else {
                    return .never()
                }
                return .just(first)
            })
    }
    
    func refreshNextLaunch() -> Completable {
        return provider.rx.request(.nextLaunch)
            .map(Launch.self)
            .flatMapCompletable({ launch -> Completable in
                return self.realm.rx.save(entity: launch)
                    .asSingle()
                    .asCompletable()
            })
    }
}
