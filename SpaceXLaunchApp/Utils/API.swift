//
//  API.swift
//  SpaceXLaunchApp
//
//  Created by Mariusz Sut on 22/06/2019.
//  Copyright © 2019 Mariusz Sut. All rights reserved.
//

import Foundation
import Moya

enum SpaceXService {
    case nextLaunch
}

extension SpaceXService : TargetType {
    var baseURL: URL {
        return URL(string: "https://api.spacexdata.com/v3")!
    }
    
    var path: String {
        switch self {
        case .nextLaunch:
            return "/launches/next"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .nextLaunch:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .nextLaunch:
            return "".data(using: .utf8)!
        }
    }
    
    var task: Task {
        switch self {
        case .nextLaunch:
            return .requestParameters(parameters: ["id": true], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
