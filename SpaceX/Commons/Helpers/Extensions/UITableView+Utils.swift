//
//  UITableView+Utils.swift
//  SpaceX
//
//  Created by Renata Martins on 26/07/2021.
//

import UIKit

extension UITableView {

    func registerCell<T: UITableViewCell>(_ classType: T.Type) {
        register(classType, forCellReuseIdentifier: classType.reusableIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(_ classType: T.Type, for indexPath: IndexPath) -> T {
        return (dequeueReusableCell(withIdentifier: classType.reusableIdentifier, for: indexPath) as? T)!
    }
}
