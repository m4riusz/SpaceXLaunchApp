//
//  UICollectionViewExtension.swift
//  SpaceXLaunchApp
//
//  Created by Mariusz Sut on 21/06/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import UIKit

extension UICollectionView {
    func register(_ cell: UICollectionViewCell.Type) {
        self.register(cell, forCellWithReuseIdentifier: cell.reusableIdentifier())
    }
}
