//
//  String+Utils.swift
//  SpaceX
//
//  Created by Renata Martins on 29/07/2021.
//

import UIKit

extension String {

    var boolValue: Bool {
        return (self as NSString).boolValue
    }

    var localized: String {
       return  NSLocalizedString(self, comment: "\(self)_comment")
    }
}
