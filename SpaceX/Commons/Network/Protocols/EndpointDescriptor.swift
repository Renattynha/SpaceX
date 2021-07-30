//
//  Endpoint.swift
//  SpaceX
//
//  Created by Renata Martins on 26/07/2021.
//

import Foundation

public typealias Headers = [String: String]
public typealias Parameters = [String: Any]
public typealias Body = [String: Any]

protocol EndpointDescriptor {
    var method: HttpMethod { get }
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var header: Headers? { get }
    var parameters: Parameters? { get }
    var body: Body? { get }
}
