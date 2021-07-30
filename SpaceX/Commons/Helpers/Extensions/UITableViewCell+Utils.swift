//
//  UITableViewCell+Utils.swift
//  SpaceX
//
//  Created by Renata Martins on 26/07/2021.
//

import Foundation

import UIKit

extension UITableViewCell {

    static var reusableIdentifier: String {
        return String(describing: self)
    }
}
