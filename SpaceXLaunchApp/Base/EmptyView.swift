//
//  EmptyView.swift
//  SpaceXLaunchApp
//
//  Created by Mariusz Sut on 12/07/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import UIKit

class EmptyView: BaseView {
    
    enum State {
        case nextRocketEmpty
        case error
    }
    
    fileprivate var textLabel: UILabel?
    var state: State = .nextRocketEmpty {
        didSet {
            self.updateState()
        }
    }
    
    override func initialize() {
        self.initTextLabel()
    }
    
    fileprivate func initTextLabel() {
        self.textLabel = UILabel()
        self.textLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        self.textLabel?.numberOfLines = 0
        self.textLabel?.textAlignment = .center
        self.addSubview(self.textLabel!)
    
        self.textLabel?.snp.makeConstraints({ [unowned self] make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(self.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        })
    }
    
    fileprivate func updateState() {
        switch self.state {
        case .nextRocketEmpty:
            self.textLabel?.text = "EmptyViewNextLaunchNotFound".localized()
            self.textLabel?.textColor = .lightGray
        case .error:
            self.textLabel?.text = "EmptyViewError".localized()
            self.textLabel?.textColor = .red
        }
    }
}
