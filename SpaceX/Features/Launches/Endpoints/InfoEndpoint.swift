//
//  InfoEndpoint.swift
//  SpaceX
//
//  Created by Renata Martins on 28/07/2021.
//

import Foundation

struct InfoEndpoint: EndpointDescriptor {

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
        return "/v3/info"
    }

    var header: Headers? {
        return ["Content-Type": "application/json"]
    }

    var parameters: Parameters? {
        return nil
    }

    var body: Body? {
        return nil
    }
}
