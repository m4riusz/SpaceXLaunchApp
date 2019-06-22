//
//  LaunchFailureDetails.swift
//  SpaceXLaunchApp
//
//  Created by Mariusz Sut on 21/06/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation

struct LaunchFailureDetails: Codable {
    let time: Int
    let altitude: Int
    let reason: String
    
    enum CodingKeys: String, CodingKey {
        case time = "time"
        case altitude = "altitude"
        case reason = "reason"
    }
}
