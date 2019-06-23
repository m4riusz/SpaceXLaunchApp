//
//  Links.swift
//  SpaceXLaunchApp
//
//  Created by Mariusz Sut on 21/06/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation

struct Links: Codable, Equatable {
    let id: String
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
        case id = "_id"
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
    
    init(id: String,
         missionPatch: String,
         missionPatchSmall: String,
         redditCampaign: String,
         redditLaunch: String,
         redditRecovery: String,
         redditMedia: String,
         articleLink: String,
         wikipedia: String,
         videoLink: String) {
        self.id = id
        self.missionPatch = missionPatch
        self.missionPatchSmall = missionPatchSmall
        self.redditCampaign = redditCampaign
        self.redditLaunch = redditLaunch
        self.redditRecovery = redditRecovery
        self.redditMedia = redditMedia
        self.articleLink = articleLink
        self.wikipedia = wikipedia
        self.videoLink = videoLink
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try! values.decodeIfPresent(String.self, forKey: .id) ?? ""
        self.missionPatch = try! values.decodeIfPresent(String.self, forKey: .missionPatch) ?? ""
        self.missionPatchSmall = try! values.decodeIfPresent(String.self, forKey: .missionPatchSmall) ?? ""
        self.redditCampaign = try! values.decodeIfPresent(String.self, forKey: .redditCampaign) ?? ""
        self.redditLaunch = try! values.decodeIfPresent(String.self, forKey: .redditLaunch) ?? ""
        self.redditRecovery = try! values.decodeIfPresent(String.self, forKey: .redditRecovery) ?? ""
        self.redditMedia = try! values.decodeIfPresent(String.self, forKey: .redditMedia) ?? ""
        self.articleLink = try! values.decodeIfPresent(String.self, forKey: .articleLink) ?? ""
        self.wikipedia = try! values.decodeIfPresent(String.self, forKey: .wikipedia) ?? ""
        self.videoLink = try! values.decodeIfPresent(String.self, forKey: .videoLink) ?? ""
    }
}
