//
//  Rocket.swift
//  SpaceXLaunchApp
//
//  Created by Mariusz Sut on 21/06/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation

struct Rocket: Codable {
    let id: String
    let rocketId: String
    let rocketName: String
    let rocketType: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case rocketId = "rocket_id"
        case rocketName = "rocket_name"
        case rocketType = "rocket_type"
    }
}
