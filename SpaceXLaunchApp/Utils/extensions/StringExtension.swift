//
//  StringExtension.swift
//  SpaceXLaunchApp
//
//  Created by Mariusz Sut on 21/06/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    func localized(_ args: CVarArg) -> String {
        return String.localizedStringWithFormat(self.localized(), args)
    }
}
