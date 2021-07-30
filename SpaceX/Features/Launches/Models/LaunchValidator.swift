//
//  LaunchValidator.swift
//  SpaceX
//
//  Created by Renata Martins on 28/07/2021.
//

import Foundation

protocol LaunchValidator: AnyObject {

    var launch: Launch { get }

    func dateTimeToString() -> String

    func daysLaunch() -> String

    func checkIfLaunchWasPassed() -> Bool

    func rocketName() -> String
}

class LaunchViewValidator: LaunchValidator {

    var launch: Launch

    init(launch: Launch) {

        self.launch = launch
    }

    func dateTimeToString() -> String {

        return Date(unixTimestamp: launch.launch_date_unix).dateAndTimeString()
    }

    func daysLaunch() -> String {

        let days = Date(unixTimestamp: launch.launch_date_unix).daysToCurrentDate()

        return "+/-" + String(days)
    }

    func checkIfLaunchWasPassed() -> Bool {

        return Date(unixTimestamp: launch.launch_date_unix) < Date()
    }

    func rocketName() -> String {

        return (launch.rocket.rocket_name ?? "NA") + " " + (launch.rocket.rocket_type ?? "NA")
    }
}
