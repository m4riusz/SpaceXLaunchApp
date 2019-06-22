//
//  BuildConfig.swift
//  SpaceXLaunchApp
//
//  Created by Mariusz Sut on 22/06/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation

struct BuildConfig {
    
    fileprivate init() {}
    
    static func isDebug() -> Bool {
        #if DEBUG
        return true
        #endif
        return false
    }
    
    static func ifDebug(_ callback: () -> Void) {
        if BuildConfig.isDebug() {
            callback()
        }
    }
    
    static func isRelease() -> Bool {
        return !BuildConfig.isDebug()
    }
}
