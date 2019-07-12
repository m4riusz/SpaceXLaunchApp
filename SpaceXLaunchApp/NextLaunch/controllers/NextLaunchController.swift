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
    fileprivate var emptyView: EmptyView?
    fileprivate let bag = DisposeBag()
    
    override func initialize() {
        self.title = "Next Launch".localized()
        self.initTableView()
        self.initEmptyView()
        self.initBindings()
    }
    
    fileprivate func initTableView() {
        self.tableView = UITableView()
        self.tableView?.register(LaunchCell.self)
        self.tableView?.separatorColor = .clear
        self.tableView?.refreshControl = UIRefreshControl()
        self.view.addSubview(self.tableView!)
        
        self.tableView?.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
    }
    
    fileprivate func initEmptyView() {
        self.emptyView = EmptyView()
        self.tableView?.backgroundView = self.emptyView
    }
    
    fileprivate func initBindings() {
        let viewWillAppearAction = self.rx.methodInvoked(#selector(viewWillAppear(_:)))
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        
        let pullToRefreshAction = self.tableView!.refreshControl!.rx
            .controlEvent(.valueChanged)
            .asDriver()
        
        let input = NextLaunchViewModel.Input(loadData: viewWillAppearAction,
                                              refresh: pullToRefreshAction)
        
        let output = self.viewModel.transform(input: input)
        
        output.nextLaunch
            .do(onNext: { items in
                guard items.count > 0 else {
                    self.emptyView?.state = .nextRocketEmpty
                    self.emptyView?.isHidden = false
                    return
                }
                self.emptyView?.isHidden = true
            })
            .drive(self.tableView!.rx.items(dataSource: RxTableViewSectionedAnimatedDataSource<LaunchSectionViewModel>(
                configureCell: { dataSource, tableView, indexPath, item in
                    let cell = tableView.dequeueCell(LaunchCell.self, indexPath: indexPath)
                    cell.updateForItem(item)
                    return cell
            })))
            .disposed(by: self.bag)
        
        output.refreshing
            .drive(onNext: { [weak self] isRefreshing in
                guard let refreshControl = self?.tableView?.refreshControl else {
                    return
                }
                isRefreshing ? refreshControl.beginRefreshing() : refreshControl.endRefreshing()
            })
            .disposed(by: self.bag)
        
        output.refreshed
            .drive()
            .disposed(by: self.bag)
        
        output.error
            .drive(onNext: { _ in
                self.emptyView?.state = .error
                self.emptyView?.isHidden = false
            })
            .disposed(by: self.bag)
    }
}
