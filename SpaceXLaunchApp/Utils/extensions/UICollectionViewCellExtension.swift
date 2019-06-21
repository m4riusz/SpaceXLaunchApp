//
//  UICollectionViewCellExtension.swift
//  SpaceXLaunchApp
//
//  Created by Mariusz Sut on 21/06/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    class func reusableIdentifier() -> String {
        return String(describing: self)
    }
}
