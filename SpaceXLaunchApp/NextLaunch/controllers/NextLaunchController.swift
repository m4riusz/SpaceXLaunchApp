//
//  NextLaunchController.swift
//  SpaceXLaunchApp
//
//  Created by Mariusz Sut on 21/06/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation
import RxSwift
import SnapKit
import RxCocoa
import RxDataSources

class NextLaunchController: BaseViewController<NextLaunchViewModel> {
    
    fileprivate var tableView: UITableView?
    fileprivate let bag = DisposeBag()
    
    override func initialize() {
        self.title = "Next Launch".localized()
        self.initTableView()
        self.initBindings()
    }
    
    fileprivate func initTableView() {
        self.tableView = UITableView()
        self.tableView?.register(LaunchCell.self)
        self.view.addSubview(self.tableView!)
        
        self.tableView?.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
    }
    
    fileprivate func initBindings() {
        let viewWillAppear = self.rx.methodInvoked(#selector(viewWillAppear(_:)))
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        
        let viewDidAppear = self.rx.methodInvoked(#selector(viewDidAppear(_:)))
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        
        let input = NextLaunchViewModel.Input(loadData: viewWillAppear,
                                              refresh: viewDidAppear)
        
        let output = self.viewModel.transform(input: input)
        
        output.nextLaunch.drive(
            self.tableView!.rx.items(dataSource: RxTableViewSectionedAnimatedDataSource<LaunchSectionViewModel>(
                configureCell: { dataSource, tableView, indexPath, item in
                    let cell = tableView.dequeueCell(LaunchCell.self, indexPath: indexPath)
                    cell.updateForItem(item)
                    return cell
            })))
            .disposed(by: self.bag)
        
        output.refreshed
            .drive()
            .disposed(by: self.bag)
    }
}
