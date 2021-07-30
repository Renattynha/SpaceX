//
//  RefineParameters+Utils.swift
//  SpaceX
//
//  Created by Renata Martins on 29/07/2021.
//

import Foundation

extension RefineParameters {

    func launchYearsToString() -> String? {

        if let years = launch_year {
            return String(years)
        }
        return nil
    }

    mutating func clearAll() {

        launch_success = nil
        launch_year = nil
        order = nil
    }
}
