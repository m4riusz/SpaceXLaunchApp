//
//  Launch.swift
//  SpaceXLaunchApp
//
//  Created by Mariusz Sut on 21/06/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation

struct Launch: Codable, Equatable {
    let id: String
    let flightNumber: Int
    let missionName: String
    let upcoming: Bool
    let launchDateUnix: Int
    let launchSuccess: Bool
    let details: String
    var isNext: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case flightNumber = "flight_number"
        case missionName = "mission_name"
        case upcoming = "upcoming"
        case launchDateUnix = "launch_date_unix"
        case launchSuccess = "launch_success"
        case details = "details"
    }
    
    init(id: String,
         flightNumber: Int,
         missionName: String,
         upcoming: Bool,
         launchDateUnix: Int,
         launchSuccess: Bool,
         details: String,
         isNext: Bool) {
        self.id = id
        self.flightNumber = flightNumber
        self.missionName = missionName
        self.upcoming = upcoming
        self.launchDateUnix = launchDateUnix
        self.launchSuccess = launchSuccess
        self.details = details
        self.isNext = isNext
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try! values.decodeIfPresent(String.self, forKey: .id) ?? ""
        self.flightNumber = try! values.decodeIfPresent(Int.self, forKey: .flightNumber) ?? 0
        self.missionName = try! values.decodeIfPresent(String.self, forKey: .missionName) ?? ""
        self.upcoming = try! values.decodeIfPresent(Bool.self, forKey: .upcoming) ?? false
        self.launchDateUnix = try! values.decodeIfPresent(Int.self, forKey: .launchDateUnix) ?? 0
        self.launchSuccess = try! values.decodeIfPresent(Bool.self, forKey: .launchSuccess) ?? true
        self.details = try! values.decodeIfPresent(String.self, forKey: .details) ?? ""
    }
}
