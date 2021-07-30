//
//  LaunchesViewModel.swift
//  SpaceX
//
//  Created by Renata Martins on 26/07/2021.
//

import UIKit

protocol LaunchesViewModelDelegate: AnyObject {

    func reloadData(isEmpty: Bool)

    func didFailToFetchLaunches()

    func presentActionSheet(_ sheet: UIAlertController)
}

class LaunchesViewModel {

    private(set) public var data = Launches()
    private(set) public var company: Company?

    private(set) public var parameters: RefineParameters

    weak var delegate: LaunchesViewModelDelegate?

    init() {
        self.parameters = RefineParameters()
    }
    public func fetchData() {

        self.fetchLaunches()
        self.fetchCompany()
    }

    public func fetchDataWithParameters(_ parameters: RefineParameters) {

        self.parameters = parameters
        LaunchesService().fetchLaunches(parameters: parameters) { launches, error in
            self.data = launches ?? []
            if error != nil {
                self.delegate?.didFailToFetchLaunches()
            } else {
                self.delegate?.reloadData(isEmpty: self.data.count == 0)
            }
        }
    }

    public func didSelectCellAtIndexPath(_ indexPath: IndexPath) {

        if data.count > indexPath.row {
            let launch = data[indexPath.row]

            let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

            let cancel = UIAlertAction(title: "launches-cancel".localized, style: .cancel, handler: nil)
            actionSheet.addAction(cancel)

            let wikipediaPage = UIAlertAction(title: "launches-wikipedia".localized, style: .default) { _ in
                self.willOpenURL(launch.links.wikipedia)
            }
            actionSheet.addAction(wikipediaPage)

            let videoPage = UIAlertAction(title: "launches-video".localized, style: .default) { _ in
                self.willOpenURL(launch.links.video_link)
            }
            actionSheet.addAction(videoPage)

            self.delegate?.presentActionSheet(actionSheet)
        }
    }
}

extension LaunchesViewModel {

    private func willOpenURL(_ url: String?) {
        if let urlString = url, let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }

    private func fetchLaunches() {
        LaunchesService().fetchAllLaunches { launches, error in
            self.data = launches ?? []
            if error != nil {
                self.delegate?.didFailToFetchLaunches()
            } else {
                self.delegate?.reloadData(isEmpty: self.data.count == 0)
            }
        }
    }

    private func fetchCompany() {
        LaunchesService().fetchCompanyInfo { company, error in
            if let company = company {
                self.company = company
                self.delegate?.reloadData(isEmpty: false)
            }
        }
    }
}
