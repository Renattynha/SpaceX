//
//  AppCordinator.swift
//  SpaceX
//
//  Created by Renata Martins on 27/07/2021.
//

import UIKit

class AppCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    func start() {
        let launchesCoordinator = LaunchesCoordinator(navigationController: navigationController)
        configure(navigationController: navigationController)

        launchesCoordinator.start()
        childCoordinators.append(launchesCoordinator)
    }

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    private func configure(navigationController: UINavigationController) {
        Appearance.configure(navigationController.navigationBar)
    }
}
