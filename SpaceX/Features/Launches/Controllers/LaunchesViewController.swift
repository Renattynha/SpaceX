//
//  LaunchesViewController.swift
//  SpaceX
//
//  Created by Renata Martins on 26/07/2021.
//

import UIKit

class LaunchesViewController: UIViewController {

    private lazy var tableView: EmptyTableView = {
        let tableView = EmptyTableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = ColorPalete.white.toColor()
        tableView.registerCell(LaunchesViewCell.self)
        tableView.registerCell(CompanyViewCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 100
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableStatus = .loading
        return tableView
    }()

    private let viewModel: LaunchesViewModel
    private let coordinator: LaunchesCoordinator

    init(coordinator: LaunchesCoordinator, viewModel: LaunchesViewModel = LaunchesViewModel()) {

        self.viewModel = viewModel
        self.coordinator = coordinator

        super.init(nibName: nil, bundle: nil)

        self.viewModel.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {

        super.loadView()

        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

    override func viewDidLoad() {

        super.viewDidLoad()

        self.title = "launches-title".localized

        viewModel.fetchData()

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic-filter"), style: .plain, target: self, action: #selector(filterAction))
    }
}

extension LaunchesViewController {

    @objc
    func filterAction() {
        coordinator.showRefine(parameters: viewModel.parameters)
    }
}

extension LaunchesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return viewModel.data.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(CompanyViewCell.self, for: indexPath)
            cell.configure(info: viewModel.company?.description ?? "error-no-information".localized)
            cell.selectionStyle = .none
            return cell
        }

        let cell = tableView.dequeueReusableCell(LaunchesViewCell.self, for: indexPath)
        cell.backgroundColor = ColorPalete.white.toColor()
        cell.configure(launch: viewModel.data[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}

extension LaunchesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section != 0 {
            self.viewModel.didSelectCellAtIndexPath(indexPath)
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        return 40
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        if section == 0 {
            return "launches-company".localized
        }
        return "launches".localized
    }
}

extension LaunchesViewController: LaunchesViewModelDelegate {

    func didFailToFetchLaunches() {

        tableView.tableStatus = .error
        tableView.reloadData()
    }

    func presentActionSheet(_ sheet: UIAlertController) {
        self.present(sheet, animated: true, completion: nil)
    }

    func reloadData(isEmpty: Bool) {

        if isEmpty {
           tableView.tableStatus = .empty
        }
        tableView.reloadData()
    }
}

extension LaunchesViewController: RefineExternalProtocol {

    func willUpdateDataWithParameters(_ parameters: RefineParameters) {
        self.viewModel.fetchDataWithParameters(parameters)
        tableView.tableStatus = .loading
        tableView.reloadData()
    }
}
