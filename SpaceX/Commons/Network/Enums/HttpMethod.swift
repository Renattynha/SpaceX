//
//  HttpMethod.swift
//  SpaceX
//
//  Created by Renata Martins on 26/07/2021.
//

import Foundation

enum HttpMethod: String {

    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"

    func toString() -> String {
        return self.rawValue
    }
}
