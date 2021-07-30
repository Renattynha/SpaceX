//
//  NetworkError.swift
//  SpaceX
//
//  Created by Renata Martins on 26/07/2021.
//

import Foundation

enum NetworkError: Error {

    case custom(description: String)
    case serverError(statusCode: Int)
    case parseError
    case noJSONData

    public init(description: String) {
        self = .custom(description: description)
    }

    public init(statusCode: Int) {
        self = .serverError(statusCode: statusCode)
    }
}
