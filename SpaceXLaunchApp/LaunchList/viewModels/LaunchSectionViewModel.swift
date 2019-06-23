//
//  LaunchSectionViewModel.swift
//  SpaceXLaunchApp
//
//  Created by Mariusz Sut on 23/06/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation
import RxDataSources

struct LaunchSectionViewModel: AnimatableSectionModelType, Equatable {
    let identity: Int
    var items: [LaunchViewModel]
    
    init(original: LaunchSectionViewModel, items: [LaunchViewModel]) {
        self = original
        self.items = items
    }
    
    init(identity: Int = 0, items: [LaunchViewModel]) {
        self.identity = identity
        self.items = items
    }
}
