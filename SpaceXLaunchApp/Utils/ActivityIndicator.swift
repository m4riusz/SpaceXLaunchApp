//
//  ActivityIndicator.swift
//  SpaceXLaunchApp
//
//  Created by Mariusz Sut on 12/07/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import RxSwift
import RxCocoa

public class ActivityIndicator: SharedSequenceConvertibleType {
    public typealias E = Bool
    public typealias SharingStrategy = DriverSharingStrategy
    
    private let isLoading = PublishSubject<Bool>()
    private let loading: SharedSequence<SharingStrategy, E>
    
    init() {
        self.loading = self.isLoading
            .distinctUntilChanged()
            .asSharedSequence(onErrorJustReturn: false)
    }
    
    fileprivate func trackActivityOfObservable<O: ObservableConvertibleType>(_ source: O) -> Observable<O.E> {
        return source.asObservable()
            .do(onNext: { [weak self] _ in
                self?.isLoading.onNext(true)
            }, onError: { [weak self] _ in
                self?.isLoading.onNext(false)
            }, onCompleted: { [weak self] in
                self?.isLoading.onNext(false)
            }, onSubscribe: { [weak self] in
                self?.isLoading.onNext(false)
            })
    }
    
    public func asSharedSequence() -> SharedSequence<SharingStrategy, E> {
        return self.loading
    }
}

extension ObservableConvertibleType {
    public func trackActivity(_ activityIndicator: ActivityIndicator) -> Observable<E> {
        return activityIndicator.trackActivityOfObservable(self)
    }
}
