//
//  NextLaunchViewModel.swift
//  SpaceXLaunchApp
//
//  Created by Mariusz Sut on 21/06/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

struct NextLaunchViewModel: ViewModelType {
    
    struct Input {
        let loadData: Driver<Void>
    }
    
    struct Output {
        let refreshed: Driver<Void>
    }
    
    fileprivate let launchRepository: LaunchRepositoryProtocol
    
    init(launchRepository: LaunchRepositoryProtocol) {
        self.launchRepository = launchRepository
    }
    
    func transform(input: NextLaunchViewModel.Input) -> NextLaunchViewModel.Output {
        let refreshedAction = input.loadData
            .asObservable()
            .flatMapLatest { _ -> Completable in
                return self.launchRepository.refreshNextLaunch()
            }
            .flatMapLatest { completable -> Observable<Void> in
                return .just(Void())
            }
            .asDriver { (error) -> SharedSequence<DriverSharingStrategy, ()> in
                print(error.localizedDescription)
                return .never()
        }
        
        return Output(refreshed: refreshedAction)
    }
}
