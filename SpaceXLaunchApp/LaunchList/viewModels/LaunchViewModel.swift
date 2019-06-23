//
//  LaunchViewModel.swift
//  SpaceXLaunchApp
//
//  Created by Mariusz Sut on 23/06/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation
import RxDataSources

struct LaunchViewModel: IdentifiableType, Equatable {
    let identity: String
    let launch: Launch
    
    init(launch: Launch) {
        self.identity = launch.id
        self.launch = launch
    }
}
