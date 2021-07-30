//
//  LaunchView.swift
//  SpaceX
//
//  Created by Renata Martins on 27/07/2021.
//

import Foundation

typealias RowTuple = (key: String, value: String?)

struct LaunchView {

    let url: String
    let rows: [RowTuple]
    let sucess: Bool

    init(launchValidator: LaunchViewValidator) {

        self.url = launchValidator.launch.links.mission_patch ?? ""

        self.sucess = launchValidator.launch.launch_success ?? false

        var aux: [RowTuple] = []
        aux.append(RowTuple(key: "launches-mission".localized, value: launchValidator.launch.mission_name))
        aux.append(RowTuple(key: "launches-date".localized, value: launchValidator.dateTimeToString()))
        aux.append(RowTuple(key: "launches-rocket".localized, value: launchValidator.rocketName()))

        let title = launchValidator.checkIfLaunchWasPassed() ? "launches-since".localized : "launches-from".localized
        aux.append(RowTuple(key: title, value: launchValidator.daysLaunch()))
        self.rows = aux
    }
}
