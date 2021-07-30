//
//  Company.swift
//  SpaceX
//
//  Created by Renata Martins on 28/07/2021.
//

import Foundation

struct Company: Decodable {

    let name: String
    let founder: String
    let founded: Int
    let employees: Int
    let launch_sites: Int
    let valuation: Int
}

extension Company: CustomStringConvertible {

    var description: String {
        return "\(name) was founded by \(founder) in \(String(founded)). It has now \(String(employees)) employees, \(String(launch_sites)) launch sites, and is valued at USD \(String(valuation))"
    }
}
