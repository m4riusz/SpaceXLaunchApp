//
//  RMRocket.swift
//  SpaceXLaunchApp
//
//  Created by Mariusz Sut on 22/06/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation
import RealmSwift

class RMRocket: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var rocketId: String?
    @objc dynamic var rocketName: String?
    @objc dynamic var rocketType: String?
}

extension RMRocket : DomainConvertibleType {
    func asDomain() -> Rocket {
        return Rocket(id: self.id,
                      rocketId: self.rocketId!,
                      rocketName: self.rocketName!,
                      rocketType: self.rocketType!)
    }
}

extension Rocket : RealmRepresentable {
    func asRealm() -> RMRocket {
        return RMRocket.build({ object in
            object.id = self.id
            object.rocketId = self.rocketId
            object.rocketName = self.rocketName
            object.rocketType = self.rocketType
        })
    }
}
