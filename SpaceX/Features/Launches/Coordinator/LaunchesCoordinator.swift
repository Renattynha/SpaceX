//
//  LaunchesCoordinator.swift
//  SpaceX
//
//  Created by Renata Martins on 27/07/2021.
//

import UIKit

protocol LaunchesCoordinatorProtocol: AnyObject {

    func showRefine(parameters: RefineParameters)
}

class LaunchesCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    var mainViewController: LaunchesViewController?

    func start() {
        let launchesVC = LaunchesViewController(coordinator: self)
        mainViewController = launchesVC
        navigationController.viewControllers = [ launchesVC ]
    }

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension LaunchesCoordinator: LaunchesCoordinatorProtocol {

    func showRefine(parameters: RefineParameters) {

        let refineCoordinator = RefineCoordinator(navigationController: UINavigationController())
        refineCoordinator.parameters = parameters
        refineCoordinator.start()
        refineCoordinator.mainViewController?.delegate = mainViewController

        self.navigationController.present(refineCoordinator.navigationController, animated: true, completion: nil)
    }
}
