//
//  Coordinator.swift
//  SpaceX
//
//  Created by Renata Martins on 27/07/2021.
//

import Foundation

protocol Coordinator: AnyObject {

    var childCoordinators: [Coordinator] { get set }

    func start()
}
