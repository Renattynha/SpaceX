//
//  YearsViewModel.swift
//  SpaceX
//
//  Created by Renata Martins on 29/07/2021.
//

import UIKit

protocol YearsViewModelDelegate: AnyObject {

    func reloadData()

    func updateActionsState()
}

class YearsViewModel {

    private(set) public var data: [Int] = []
    private(set) public var selectedData: Int?

    private var parameters: RefineParameters

    weak var delegate: YearsViewModelDelegate?

    init(parameters: RefineParameters) {
        self.parameters = parameters

        self.selectedData = self.parameters.launch_year
    }

    public func fetchData() {

        let currentYear = Date().currentYear()
        self.data = Array(2006...currentYear)

        self.delegate?.reloadData()
    }

    public func didSelectAtIndexPath(_ indexPath: IndexPath) {

        if indexPath.row < data.count {
            let item = data[indexPath.row]

            if selectedData == item {
                selectedData = nil
            } else {
                selectedData = item
            }
        }
        self.delegate?.updateActionsState()
    }

    public func clearAll() {

        self.selectedData = nil
        self.delegate?.reloadData()
        self.delegate?.updateActionsState()
    }

    public func returnUpdatedParameters() -> RefineParameters {
        self.parameters.launch_year = self.selectedData
        return parameters
    }
}
