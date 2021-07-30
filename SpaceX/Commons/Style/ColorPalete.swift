//
//  ColorPalete.swift
//  SpaceX
//
//  Created by Renata Martins on 27/07/2021.
//

import UIKit

enum ColorPalete: String {

    case black = "292D3C"
    case silver = "767981"
    case gray =  "DFE0E0"
    case white = "FFFFFF"
    case orange = "EF8354"
    case blue = "4F5D75"

    func toColor() -> UIColor {
        return UIColor(hex: self.rawValue)
    }
}
