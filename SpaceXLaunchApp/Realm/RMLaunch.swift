//
//  RMLaunch.swift
//  SpaceXLaunchApp
//
//  Created by Mariusz Sut on 22/06/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation
import RealmSwift

class RMLaunch: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var flightNumber: Int = 0
    @objc dynamic var missionName: String?
    @objc dynamic var upcoming: Bool = false
    @objc dynamic var launchDateUnix: Int = 0
    @objc dynamic var launchDateUtc: String?
    @objc dynamic var launchDateLocal: Date?
    @objc dynamic var rocket: RMRocket?
    @objc dynamic var launchSuccess: Bool = true
    @objc dynamic var details: String?
}

extension RMLaunch : DomainConvertibleType {
    func asDomain() -> Launch {
        return Launch(id: self.id,
                      flightNumber: self.flightNumber,
                      missionName: self.missionName!,
                      upcoming: self.upcoming,
                      launchDateUnix: self.launchDateUnix,
                      launchDateUtc: self.launchDateUtc!,
                      launchDateLocal: self.launchDateLocal!,
                      rocket: self.rocket!.asDomain(),
                      launchSuccess: self.launchSuccess,
                      details: self.details!)
    }
}

extension Launch : RealmRepresentable {
    func asRealm() -> RMLaunch {
        return RMLaunch.build({ object in
            object.id = self.id
            object.flightNumber = self.flightNumber
            object.missionName = self.missionName
            object.upcoming = upcoming
            object.launchDateUnix = self.launchDateUnix
            object.launchDateUtc = self.launchDateUtc
            object.launchDateLocal = self.launchDateLocal
            object.rocket = self.rocket.asRealm()
            object.launchSuccess = self.launchSuccess
            object.details = self.details
        })
    }
}
