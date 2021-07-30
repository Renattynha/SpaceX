//
//  UIStackView+Utils.swift
//  SpaceX
//
//  Created by Renata Martins on 27/07/2021.
//

import UIKit

extension UIStackView {

   func removeAllArrangedSubviews() {

      arrangedSubviews.forEach {
            self.removeArrangedSubview($0)
            NSLayoutConstraint.deactivate($0.constraints)
            $0.removeFromSuperview()
        }
    }
}
