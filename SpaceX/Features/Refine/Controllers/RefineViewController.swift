//
//  RefineLaunchesViewController.swift
//  SpaceX
//
//  Created by Renata Martins on 27/07/2021.
//

import UIKit

class RefineViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        FormItemCellType.registerCells(for: tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        return tableView
    }()

    private lazy var btSearch: UIButton = {
        let bt = UIButton(type: .system)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.addTarget(self, action: #selector(willSearch), for: .touchUpInside)
        bt.setTitle("refine-search".localized, for: .normal)
        bt.backgroundColor = ColorPalete.orange.toColor()
        bt.setTitleColor(ColorPalete.white.toColor(), for: .normal)
        return bt
    }()

    weak var delegate: RefineExternalProtocol?

    private let viewModel: RefineViewModel

    init(viewModel: RefineViewModel) {

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

        view.addSubview(btSearch)
        btSearch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Spacing.M.rawValue).isActive = true
        btSearch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Spacing.M.rawValue).isActive = true
        btSearch.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Spacing.M.rawValue).isActive = true
        btSearch.heightAnchor.constraint(equalToConstant: Sizing.L.rawValue).isActive = true
    }

    override func viewDidLoad() {

        super.viewDidLoad()

        self.title = "refine".localized

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "refine-clear-all".localized,
                                                            style: .plain, target: self,
                                                            action: #selector(filterAction))
    }
}

extension RefineViewController {

    @objc
    func filterAction() {
        self.viewModel.clearAllFilters()
    }

    @objc
    func willSearch() {
        self.delegate?.willUpdateDataWithParameters(viewModel.parameters)
        dismiss(animated: true, completion: nil)
    }
}

extension RefineViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section < viewModel.form.sections.count {
            return viewModel.form.sections[section].items.count
        }
        return 0
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.form.sections.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section < viewModel.form.sections.count {
            let section = viewModel.form.sections[indexPath.section]

            if indexPath.row < section.items.count {
                let item = section.items[indexPath.row]

                let cell = item.cellType.dequeueCell(for: tableView, at: indexPath)
                cell.selectionStyle = .none

                if let formUpdatableCell = cell as? FormUpdatable {
                    formUpdatableCell.update(with: item)
                }

                return cell
            }
        }

        return UITableViewCell()
    }
}

extension RefineViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        return 40
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        if viewModel.form.sections.count > section {
            return viewModel.form.sections[section].title
        }
        return nil
    }
}

extension RefineViewController: RefineViewModelDelegate {

    func presentActionSheet(_ sheet: UIAlertController) {
        self.present(sheet, animated: true, completion: nil)
    }

    func reloadData() {
        tableView.reloadData()
    }
}

extension RefineViewController: RefineInternalProtocol {

    func willUpdateParameters(_ parameters: RefineParameters) {
        viewModel.updateFormWithParameters(parameters)
    }
}
