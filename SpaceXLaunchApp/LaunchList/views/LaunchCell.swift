//
//  LaunchCell.swift
//  SpaceXLaunchApp
//
//  Created by Mariusz Sut on 23/06/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import UIKit

class LaunchCell: BaseTableViewCell {
    fileprivate var containerView: UIView?
    fileprivate var rocketImageView: UIImageView?
    fileprivate var nameLabel: UILabel?
    fileprivate var dateLabel: UILabel?
    fileprivate var infoLabel: UILabel?
    
    fileprivate struct Const {
        struct RocketImageView {
            static let minWidth: CGFloat = 100
            static let maxWidth: CGFloat = 200
            static let widthRatio: CGFloat = 0.3
        }
        struct NameLabel {
            static let fontSize: CGFloat = 16
        }
        struct DateLabel {
            static let fontSize: CGFloat = 15
        }
        struct InfoLabel {
            static let fontSize: CGFloat = 14
        }
    }
    
    override func initialize() {
        self.initContainerView()
        self.initRocketImageView()
        self.initNameLabel()
        self.initDateLabel()
        self.initInfoLabel()
    }
    
    fileprivate func initContainerView() {
        self.containerView = UIView()
        self.contentView.addSubview(self.containerView!)
        
        self.containerView?.snp.makeConstraints({ [unowned self] make in
            make.top.equalTo(self.contentView.safeAreaLayoutGuide.snp.top).offset(Spacing.normal)
            make.left.equalTo(self.contentView.safeAreaLayoutGuide.snp.left).offset(Spacing.normal)
            make.right.equalTo(self.contentView.safeAreaLayoutGuide.snp.right).offset(-Spacing.normal)
            make.bottom.equalTo(self.contentView.safeAreaLayoutGuide.snp.bottom).offset(-Spacing.normal)
        })
    }
    
    fileprivate func initRocketImageView() {
        self.rocketImageView = UIImageView()
        self.rocketImageView?.contentMode = .scaleAspectFit
        self.rocketImageView?.image = .withImage(.launch)
        self.containerView?.addSubview(self.rocketImageView!)
        
        self.rocketImageView?.snp.makeConstraints({ make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(Const.RocketImageView.widthRatio).priority(.high)
            make.width.greaterThanOrEqualTo(Const.RocketImageView.minWidth)
            make.width.lessThanOrEqualTo(Const.RocketImageView.maxWidth)
        })
    }
    
    fileprivate func initNameLabel() {
        self.nameLabel = UILabel()
        self.nameLabel?.font = .systemFont(ofSize: Const.NameLabel.fontSize, weight: .bold)
        self.containerView?.addSubview(self.nameLabel!)
        
        self.nameLabel?.snp.makeConstraints({ [unowned self] make in
            make.top.equalToSuperview()
            make.left.equalTo(self.rocketImageView!.snp.right).offset(Spacing.normal)
            make.right.equalToSuperview()
        })
    }
    
    fileprivate func initDateLabel() {
        self.dateLabel = UILabel()
        self.dateLabel?.font = .systemFont(ofSize: Const.DateLabel.fontSize, weight: .light)
        self.containerView?.addSubview(self.dateLabel!)
        
        self.dateLabel?.snp.makeConstraints({ [unowned self] make in
            make.top.equalTo(self.nameLabel!.snp.bottom).offset(Spacing.normal)
            make.left.equalTo(self.rocketImageView!.snp.right).offset(Spacing.normal)
            make.right.equalToSuperview()
        })
    }
    
    fileprivate func initInfoLabel() {
        self.infoLabel = UILabel()
        self.infoLabel?.font = .systemFont(ofSize: Const.InfoLabel.fontSize, weight: .regular)
        self.infoLabel?.numberOfLines = 0
        self.containerView?.addSubview(self.infoLabel!)
        
        self.infoLabel?.snp.makeConstraints({ [unowned self] make in
            make.top.equalTo(self.dateLabel!.snp.bottom).offset(Spacing.normal)
            make.left.equalTo(self.rocketImageView!.snp.right).offset(Spacing.normal)
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        })
    }
    
    func updateForItem(_ item: LaunchViewModel) {
        self.nameLabel?.text = item.launch.missionName
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        self.dateLabel?.text = dateFormatter.string(from: item.launch.launchDate)
        self.infoLabel?.text = item.launch.details
    }
}
