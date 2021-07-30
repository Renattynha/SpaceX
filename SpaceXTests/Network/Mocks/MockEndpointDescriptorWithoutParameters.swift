//
//  MockEndpointDescriptorWithoutParameters.swift
//  SpaceXTests
//
//  Created by Renata Martins on 26/07/2021.
//

import Foundation
@testable import SpaceX

class MockEndpointDescriptorWithoutParameters: EndpointDescriptor {

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
        return "v3/capsules"
    }

    var header: Headers? {
        return  ["Content-Type": "application/json"]
    }

    var parameters: Parameters? {
        return nil
    }

    var body: Body? {
        return nil
    }
}
