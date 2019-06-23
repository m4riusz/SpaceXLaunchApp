//
//  Launch.swift
//  SpaceXLaunchApp
//
//  Created by Mariusz Sut on 21/06/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation

enum LaunchState: Int, Codable {
    case notStarted
    case success
    case failure
    
    static func fromBool(_ state: Bool?) -> LaunchState {
        guard let hasState = state else {
            return .notStarted
        }
        return hasState ? .success : .failure
    }
}

struct Launch: Codable, Equatable {
    let id: String
    let flightNumber: Int
    let missionName: String
    let upcoming: Bool
    let launchDate: Date
    let launchState: LaunchState
    let details: String
    let rocket: Rocket
    let links: Links
    var isNext: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case flightNumber = "flight_number"
        case missionName = "mission_name"
        case upcoming = "upcoming"
        case launchDate = "launch_date_unix"
        case launchState = "launch_success"
        case details = "details"
        case rocket = "rocket"
        case links = "links"
    }
    
    init(id: String,
         flightNumber: Int,
         missionName: String,
         upcoming: Bool,
         launchDate: Date,
         launchState: LaunchState,
         details: String,
         rocket: Rocket,
         links: Links,
         isNext: Bool) {
        self.id = id
        self.flightNumber = flightNumber
        self.missionName = missionName
        self.upcoming = upcoming
        self.launchDate = launchDate
        self.launchState = launchState
        self.details = details
        self.rocket = rocket
        self.links = links
        self.isNext = isNext
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try! values.decodeIfPresent(String.self, forKey: .id) ?? ""
        self.flightNumber = try! values.decodeIfPresent(Int.self, forKey: .flightNumber) ?? 0
        self.missionName = try! values.decodeIfPresent(String.self, forKey: .missionName) ?? ""
        self.upcoming = try! values.decodeIfPresent(Bool.self, forKey: .upcoming) ?? false
        let unixTime: TimeInterval = try! values.decodeIfPresent(Double.self, forKey: .launchDate) ?? 0
        self.launchDate = Date(timeIntervalSince1970: unixTime)
        self.launchState = LaunchState.fromBool(try! values.decodeIfPresent(Bool.self, forKey: .launchState))
        self.details = try! values.decodeIfPresent(String.self, forKey: .details) ?? ""
        self.rocket = try! values.decode(Rocket.self, forKey: .rocket)
        self.links = try! values.decode(Links.self, forKey: .links)
    }
}
