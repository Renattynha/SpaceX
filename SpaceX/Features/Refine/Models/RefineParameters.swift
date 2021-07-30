//
//  LaunchParameters.swift
//  SpaceX
//
//  Created by Renata Martins on 27/07/2021.
//

import Foundation

struct RefineParameters: DictionaryConvertor {

    var launch_year: Int?
    var launch_success: Bool?
    var order: Sort?
}

enum Sort: String {

    case asc
    case desc

    func toString() -> String {

        switch  self {
        case .asc:
            return "refine-sort-asc".localized
        case .desc:
            return "refine-sort-desc".localized
        }
    }
}
