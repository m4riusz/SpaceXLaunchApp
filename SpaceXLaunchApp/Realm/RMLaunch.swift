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
    @objc dynamic var launchSuccess: Bool = true
    @objc dynamic var details: String?
    @objc dynamic var isNext: Bool = false
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

extension RMLaunch : DomainConvertibleType {
    func asDomain() -> Launch {
        return Launch(id: self.id,
                      flightNumber: self.flightNumber,
                      missionName: self.missionName!,
                      upcoming: self.upcoming,
                      launchDateUnix: self.launchDateUnix,
                      launchSuccess: self.launchSuccess,
                      details: self.details!,
                      isNext: self.isNext)
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
            object.launchSuccess = self.launchSuccess
            object.details = self.details
            object.isNext = self.isNext
        })
    }
}
