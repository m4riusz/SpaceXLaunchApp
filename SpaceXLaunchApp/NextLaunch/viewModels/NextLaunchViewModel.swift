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
        let refresh: Driver<Void>
    }
    
    struct Output {
        let nextLaunch: Driver<[LaunchSectionViewModel]>
        let refreshing: Driver<Bool>
        let refreshed: Driver<Void>
        let error: Driver<Error>
    }
    
    fileprivate let launchRepository: LaunchRepositoryProtocol
    
    init(launchRepository: LaunchRepositoryProtocol) {
        self.launchRepository = launchRepository
    }
    
    func transform(input: NextLaunchViewModel.Input) -> NextLaunchViewModel.Output {
        
        let errorTracker = ErrorTracker()
        let activityIndicator = ActivityIndicator()
        
        let loadAction = input.loadData
            .asObservable()
            .flatMapLatest { _ -> Observable<Launch?> in
                return self.launchRepository.getNextLaunch()
            }
            .flatMapLatest({ launch -> Observable<[LaunchSectionViewModel]> in
                guard let nextLaunch = launch else {
                    return .just([])
                }
                return .just([LaunchSectionViewModel(items: [LaunchViewModel(launch: nextLaunch)])])
            })
            .asDriver(onErrorJustReturn: [])
        
        let refreshedAction = input.refresh
            .asObservable()
            .flatMapLatest { _ -> Observable<Void> in
                return self.launchRepository.refreshNextLaunch()
                    .trackError(errorTracker)
                    .catchErrorJustReturn(Void())
                    .trackActivity(activityIndicator)
            }
            .asDriverOnErrorJustComplete()
        
        let errorAction = errorTracker
            .asDriver()
        
        return Output(nextLaunch: loadAction,
                      refreshing: activityIndicator.asDriver(),
                      refreshed: refreshedAction,
                      error: errorAction)
    }
}
