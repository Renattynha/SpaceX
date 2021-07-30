//
//  Launch.swift
//  SpaceX
//
//  Created by Renata Martins on 26/07/2021.
//

import Foundation

typealias Launches = [Launch]
typealias Links = [Link]

struct Launch: Decodable {

    let mission_name: String?
    let rocket: Rocket
    let launch_success: Bool?
    let launch_date_unix: Int
    let links: Link
}

struct Rocket: Decodable {

    let rocket_name: String?
    let rocket_type: String?
}

struct Link: Decodable {
    let mission_patch: String?
    let wikipedia: String?
    let video_link: String?
}
