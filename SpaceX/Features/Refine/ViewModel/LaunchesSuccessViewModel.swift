//
//  LaunchesSuccessViewModel.swift
//  SpaceX
//
//  Created by Renata Martins on 30/07/2021.
//

import UIKit

protocol LaunchesSuccessViewModelDelegate: AnyObject {

    func reloadData()

    func updateActionsState()
}

class LaunchesSuccessViewModel {

    private(set) public var data: [Bool] = [true, false]
    private(set) public var selectedData: Bool?

    private var parameters: RefineParameters

    weak var delegate: LaunchesSuccessViewModelDelegate?

    init(parameters: RefineParameters) {
        self.parameters = parameters

        self.selectedData = self.parameters.launch_success
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
        self.parameters.launch_success = self.selectedData
        return parameters
    }
}
