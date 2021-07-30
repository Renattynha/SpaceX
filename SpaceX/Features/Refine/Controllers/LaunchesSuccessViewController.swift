//
//  LaunchesSuccessViewController.swift
//  SpaceX
//
//  Created by Renata Martins on 30/07/2021.
//

import UIKit

class LaunchesSuccessViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.registerCell(YearViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.allowsMultipleSelection = false
        return tableView
    }()

    private let viewModel: LaunchesSuccessViewModel

    weak var delegate: RefineInternalProtocol?

    init(viewModel: LaunchesSuccessViewModel) {

        self.viewModel = viewModel

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

        self.title = "refine-launch-success".localized

        self.tableView.reloadData()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "refine-clear".localized, style: .plain, target: self, action: #selector(clearAll))
        navigationItem.rightBarButtonItem?.isEnabled = viewModel.selectedData != nil
    }

    override func viewWillDisappear(_ animated: Bool) {

        super.viewWillDisappear(animated)

        self.delegate?.willUpdateParameters(viewModel.returnUpdatedParameters())
    }
}

extension LaunchesSuccessViewController {

    @objc
    func clearAll() {
        self.viewModel.clearAll()
    }
}

extension LaunchesSuccessViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return viewModel.data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(YearViewCell.self, for: indexPath)
        cell.selectionStyle = .none

        if indexPath.row < viewModel.data.count {
            let item = viewModel.data[indexPath.row]
            cell.configure(value: item.description.capitalized)

            if viewModel.selectedData == item {
                tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
            }
        }

        return cell
    }
}

extension LaunchesSuccessViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectAtIndexPath(indexPath)

        if viewModel.selectedData != nil {
            self.tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        } else {
            self.tableView.deselectRow(at: indexPath, animated: false)
        }
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        viewModel.didSelectAtIndexPath(indexPath)
    }
}

extension LaunchesSuccessViewController: LaunchesSuccessViewModelDelegate {

    func updateActionsState() {

        navigationItem.rightBarButtonItem?.isEnabled = viewModel.selectedData != nil
    }

    func reloadData() {
        self.tableView.reloadData()
    }
}
