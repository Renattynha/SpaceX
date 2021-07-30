//
//  RefineForm.swift
//  SpaceX
//
//  Created by Renata Martins on 28/07/2021.
//

import UIKit

protocol RefineFormDelegate: AnyObject {

    func willOpenYearsFilter()

    func willOpenLaunchesFilter()

    func willSortWithType(_ type: Sort)
}

class RefineForm {

    var sections = [FormSection]()

    weak var delegate: RefineFormDelegate?

    init(parameters: RefineParameters) {

        self.configureSections(parameters: parameters)
    }

    private func configureSections(parameters: RefineParameters) {

        let sort = sortSection(parameters: parameters)

        let filter = filterSection(parameters: parameters)

        sections = [sort, filter]
    }

    private func sortSection(parameters: RefineParameters) -> FormSection {

        var asc = FormItem(value: parameters.order?.toString(), placeholder: "refine-sort-asc".localized, cellType: .plainField)
        asc.actionCompletion = { [weak self] in
            self?.delegate?.willSortWithType(.asc)
        }

        var desc = FormItem(value: parameters.order?.toString(), placeholder: "refine-sort-desc".localized, cellType: .plainField)
        desc.actionCompletion = { [weak self] in
            self?.delegate?.willSortWithType(.desc)
        }

        var items: [FormItem]
        items = [asc, desc]

        return FormSection(title: "refine-sort".localized, items: items)
    }

    func filterSection(parameters: RefineParameters) -> FormSection {

        var years = FormItem(value: parameters.launchYearsToString(), placeholder: "refine-years".localized, cellType: .actionField)
        years.actionCompletion = { [weak self] in
            self?.delegate?.willOpenYearsFilter()
        }

        var launches = FormItem(value: parameters.launch_success?.description.capitalized, placeholder: "refine-launch-success".localized, cellType: .actionField)
        launches.actionCompletion = { [weak self] in
            self?.delegate?.willOpenLaunchesFilter()
        }

        return FormSection(title: "refine-filters".localized, items: [years, launches])
    }
}

extension RefineForm {

    public func updateForm(parameters: RefineParameters) {

        configureSections(parameters: parameters)
    }
}
