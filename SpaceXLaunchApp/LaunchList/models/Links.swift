//
//  Links.swift
//  SpaceXLaunchApp
//
//  Created by Mariusz Sut on 21/06/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation

struct Links: Codable {
    let missionPatch: String
    let missionPatchSmall: String
    let redditCampaign: String
    let redditLaunch: String
    let redditRecovery: String
    let redditMedia: String
    let articleLink: String
    let wikipedia: String
    let videoLink: String
    
    enum CodingKeys: String, CodingKey {
        case missionPatch = "mission_patch"
        case missionPatchSmall = "mission_patch_small"
        case redditCampaign = "reddit_campaign"
        case redditLaunch = "reddit_launch"
        case redditRecovery = "reddit_recovery"
        case redditMedia = "reddit_media"
        case articleLink = "article_link"
        case wikipedia = "wikipedia"
        case videoLink = "video_link"
    }
}
