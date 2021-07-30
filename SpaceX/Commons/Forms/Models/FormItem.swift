//
//  FormItem.swift
//  SpaceX
//
//  Created by Renata Martins on 28/07/2021.
//

import Foundation

struct FormItem {

    var value: String?
    var placeholder = ""
    var cellType: FormItemCellType
    var valueCompletion: ((String?) -> Void)?
    var actionCompletion: (() -> Void)?
}
