//
//  LaunchSite.swift
//  SpaceXLaunchApp
//
//  Created by Mariusz Sut on 21/06/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation

struct LaunchSite: Codable {
    let siteId: String
    let siteName: String
    let siteNameLong: String
    
    enum CodingKeys: String, CodingKey {
        case siteId = "site_id"
        case siteName = "site_name"
        case siteNameLong = "site_name_long"
    }
}
