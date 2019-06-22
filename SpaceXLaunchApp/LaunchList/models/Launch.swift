//
//  Launch.swift
//  SpaceXLaunchApp
//
//  Created by Mariusz Sut on 21/06/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation

struct Launch: Codable {
    let id: String
    let flightNumber: Int
    let missionName: String
    let upcoming: Bool
    let launchDateUnix: Int
    let launchDateUtc: String
    let launchDateLocal: Date
    let rocket: Rocket
//    let launchSite: LaunchSite
    let launchSuccess: Bool
//    let launchFailureDetails: LaunchFailureDetails?
//    let links: Links
    let details: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case flightNumber = "flight_number"
        case missionName = "mission_name"
        case upcoming = "upcoming"
        case launchDateUnix = "launch_date_unix"
        case launchDateUtc = "launch_date_utc"
        case launchDateLocal = "launch_date_local"
        case rocket = "rocket"
//        case launchSite = "launch_site"
        case launchSuccess = "launch_success"
//        case launchFailureDetails = "launch_failure_details"
//        case links = "links"
        case details = "details"
    }
}
