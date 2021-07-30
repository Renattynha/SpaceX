//
//  FormItemType.swift
//  SpaceX
//
//  Created by Renata Martins on 28/07/2021.
//

import UIKit

protocol FormUpdatable {
    func update(with formItem: FormItem)
}

protocol FormConformity {
    var formItem: FormItem? { get set }
}

enum FormItemCellType {

    case actionField
    case plainField

    static func registerCells(for tableView: UITableView) {

        tableView.registerCell(FormActionCellView.self)
        tableView.registerCell(FormPlainCellView.self)
    }

    func dequeueCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell

        switch self {
        case .actionField:
            cell = tableView.dequeueReusableCell(FormActionCellView.self, for: indexPath)
        case .plainField:
            cell = tableView.dequeueReusableCell(FormPlainCellView.self, for: indexPath)
        }

        return cell
    }
}
