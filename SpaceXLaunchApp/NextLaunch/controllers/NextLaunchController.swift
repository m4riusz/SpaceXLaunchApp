//
//  NextLaunchController.swift
//  SpaceXLaunchApp
//
//  Created by Mariusz Sut on 21/06/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class NextLaunchController: BaseViewController<NextLaunchViewModel> {
    
    fileprivate let bag = DisposeBag()
    
    override func initialize() {
        self.view.backgroundColor = .green
        
//        let viewWillAppear = self.rx.methodInvoked(#selector(viewWillAppear(_:)))
//            .subscribe(onNext: { (_) in
//                print("a")
//            })
//
        let viewWillAppear = self.rx.methodInvoked(#selector(viewWillAppear(_:)))
            .flatMapLatest { _ -> Observable<Void> in
                print("a")
            return .just(Void())
        }
        .asDriver(onErrorJustReturn: Void())

        let output = self.viewModel.transform(input: NextLaunchViewModel.Input(loadData: viewWillAppear))
        output.refreshed.drive().disposed(by: self.bag)
    }
    
    override func loadScreenData() {
        
    }
}
