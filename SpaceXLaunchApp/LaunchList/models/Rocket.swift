//
//  Rocket.swift
//  SpaceXLaunchApp
//
//  Created by Mariusz Sut on 21/06/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation

struct Rocket: Codable, Equatable {
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
    
    init(id: String,
         rocketId: String,
         rocketName: String,
         rocketType: String) {
        self.id = id
        self.rocketId = rocketId
        self.rocketName = rocketName
        self.rocketType = rocketType
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try! values.decodeIfPresent(String.self, forKey: .id) ?? ""
        self.rocketId = try! values.decodeIfPresent(String.self, forKey: .rocketId) ?? ""
        self.rocketName = try! values.decodeIfPresent(String.self, forKey: .rocketName) ?? ""
        self.rocketType = try! values.decodeIfPresent(String.self, forKey: .rocketType) ?? ""
    }
}
