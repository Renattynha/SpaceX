//
//  RefineCoordinator.swift
//  SpaceX
//
//  Created by Renata Martins on 28/07/2021.
//

import UIKit

protocol RefineCoordinatorProtocol: AnyObject {

    func showYearsList(parameters: RefineParameters)

    func showLaunchesSuccess(parameters: RefineParameters)
}

class RefineCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    var mainViewController: RefineViewController?

    var parameters: RefineParameters?

    func start() {
        let refineVC = RefineViewController(viewModel: RefineViewModel(parameters: parameters ?? RefineParameters(), coordinator: self))
        mainViewController = refineVC
        navigationController.viewControllers = [ refineVC ]
    }

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension RefineCoordinator: RefineCoordinatorProtocol {

    func showLaunchesSuccess(parameters: RefineParameters) {
        let viewController = LaunchesSuccessViewController(viewModel: LaunchesSuccessViewModel(parameters: parameters))
        viewController.delegate = mainViewController
        self.navigationController.show(viewController, sender: self)
    }

    func showYearsList(parameters: RefineParameters) {
        let viewController = YearsViewController(viewModel: YearsViewModel(parameters: parameters))
        viewController.delegate = mainViewController
        self.navigationController.show(viewController, sender: self)
    }
}
