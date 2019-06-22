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
        
        let viewWillAppear = self.rx.methodInvoked(#selector(viewWillAppear(_:)))
            .mapToVoid()
            .asDriverOnErrorJustComplete()

        let viewDidAppear = self.rx.methodInvoked(#selector(viewDidAppear(_:)))
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        
        let input = NextLaunchViewModel.Input(loadData: viewWillAppear,
                                              refresh: viewDidAppear)

        let output = self.viewModel.transform(input: input)
        
        output.nextLaunch
            .drive(onNext: { launch in
                print(launch)
            })
            .disposed(by: self.bag)
        
        output.refreshed
            .drive()
            .disposed(by: self.bag)
    }
}
