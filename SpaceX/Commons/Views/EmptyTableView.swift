//
//  EmptyTableView.swift
//  SpaceX
//
//  Created by Renata Martins on 30/07/2021.
//

import UIKit

public enum TableStatus {
    case loading
    case error
    case empty
}

public protocol TableViewEmptyDelegate: AnyObject {

    func willRetry()
}

public class EmptyTableView: UITableView {

    public weak var emptyDelegate: TableViewEmptyDelegate?

    public var tableStatus: TableStatus? {
        didSet {
            switch tableStatus {
            case .loading:
                self.backgroundView = EmptyView(type: .loading)
            case .error:
                self.backgroundView = EmptyView(type: .error, delegate: self)
            case .empty:
                self.backgroundView = EmptyView(type: .empty)
            case .none:
                self.backgroundView = nil
            }
        }
    }
}

extension EmptyTableView: EmptyViewDelegate {

    public func emptyViewDidTryToRetry() {
        tableStatus = .loading
        self.emptyDelegate?.willRetry()
    }
}
