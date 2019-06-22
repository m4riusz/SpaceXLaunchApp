//
//  UIImageExtension.swift
//  SpaceXLaunchApp
//
//  Created by Mariusz Sut on 22/06/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import UIKit

extension UIImage {
    static func withImage(_ image: Images, template: Bool = true) -> UIImage {
        guard template else {
            return UIImage(named: image.rawValue)!
        }
        return UIImage(named: image.rawValue)!.withRenderingMode(.alwaysTemplate)
    }
}
