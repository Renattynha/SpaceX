//
//  LaunchesEndpoint.swift
//  SpaceX
//
//  Created by Renata Martins on 26/07/2021.
//

import Foundation

enum LaunchesEndpoint {

    case allLaunches
    case launches(parameters: RefineParameters)
}

extension LaunchesEndpoint: EndpointDescriptor {

    var method: HttpMethod {
        return .get
    }

    var scheme: String {
        return "https"
    }

    var host: String {
        return "api.spacexdata.com"
    }

    var path: String {
        return "/v3/launches"
    }

    var header: Headers? {
        return ["Content-Type": "application/json"]
    }

    var parameters: Parameters? {
        switch self {
        case .allLaunches:
            return nil
        case .launches(let parameters):
            return parameters.toDictionary()
        }
    }

    var body: Body? {
        return nil
    }
}
