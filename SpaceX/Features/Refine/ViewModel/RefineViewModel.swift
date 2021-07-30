//
//  RefineViewModel.swift
//  SpaceX
//
//  Created by Renata Martins on 28/07/2021.
//

import UIKit

protocol RefineViewModelDelegate: AnyObject {

    func reloadData()

    func presentActionSheet(_ sheet: UIAlertController)
}

class RefineViewModel {

    weak var delegate: RefineViewModelDelegate?

    private(set) public var parameters: RefineParameters
    private let coordinator: RefineCoordinator

    private(set) public var form: RefineForm

    init(parameters: RefineParameters, coordinator: RefineCoordinator) {
        self.parameters = parameters
        self.coordinator = coordinator
        self.form = RefineForm(parameters: parameters)
        self.form.delegate = self
    }

    public func updateFormWithParameters(_ parameters: RefineParameters) {

        self.parameters = parameters
        self.updateTableData()
    }

    public func clearAllFilters() {

        self.parameters.clearAll()
        self.updateTableData()
    }
}

extension RefineViewModel {

    private func updateTableData() {

        self.form.updateForm(parameters: self.parameters)
        self.delegate?.reloadData()
    }
}

extension RefineViewModel: RefineFormDelegate {

    func willOpenLaunchesFilter() {
        coordinator.showLaunchesSuccess(parameters: parameters)
    }

    func willSortWithType(_ type: Sort) {
        self.parameters.order = type
        self.updateTableData()
    }

    func willOpenYearsFilter() {
        coordinator.showYearsList(parameters: parameters)
    }
}
