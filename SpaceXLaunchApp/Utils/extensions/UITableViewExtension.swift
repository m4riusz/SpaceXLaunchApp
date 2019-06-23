//
//  UITableViewExtension.swift
//  SpaceXLaunchApp
//
//  Created by Mariusz Sut on 21/06/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import UIKit

extension UITableView {
    func register(_ cell: UITableViewCell.Type) {
        self.register(cell, forCellReuseIdentifier: cell.reusableIdentifier())
    }
    
    func dequeueCell<T: UITableViewCell>(_ cell: T.Type, indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: T.reusableIdentifier(), for: indexPath) as! T
    }
}
