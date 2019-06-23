//
//  RMLinks.swift
//  SpaceXLaunchApp
//
//  Created by Mariusz Sut on 23/06/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation
import RealmSwift

class RMLinks: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var missionPatch: String?
    @objc dynamic var missionPatchSmall: String?
    @objc dynamic var redditCampaign: String?
    @objc dynamic var redditLaunch: String?
    @objc dynamic var redditRecovery: String?
    @objc dynamic var redditMedia: String?
    @objc dynamic var articleLink: String?
    @objc dynamic var wikipedia: String?
    @objc dynamic var videoLink: String?
}

extension RMLinks : DomainConvertibleType {
    func asDomain() -> Links {
        return Links(id: self.id,
                     missionPatch: self.missionPatch ?? "",
                     missionPatchSmall: self.missionPatchSmall ?? "",
                     redditCampaign: self.redditCampaign ?? "",
                     redditLaunch: self.redditLaunch ?? "",
                     redditRecovery: self.redditRecovery ?? "",
                     redditMedia: self.redditMedia ?? "",
                     articleLink: self.articleLink ?? "",
                     wikipedia: self.wikipedia ?? "",
                     videoLink: self.videoLink ?? "")
    }
}

extension Links : RealmRepresentable {
    func asRealm() -> RMLinks {
        return RMLinks.build({ object in
            object.id = self.id
            object.missionPatch = self.missionPatch
            object.missionPatchSmall = self.missionPatch
            object.redditCampaign = self.redditCampaign
            object.redditLaunch = self.redditLaunch
            object.redditRecovery = self.redditRecovery
            object.redditMedia = self.redditMedia
            object.articleLink = self.articleLink
            object.wikipedia = self.wikipedia
            object.videoLink = self.videoLink
        })
    }
}

