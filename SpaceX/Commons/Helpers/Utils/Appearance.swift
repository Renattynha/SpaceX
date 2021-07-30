//
//  Appearance.swift
//  SpaceX
//
//  Created by Renata Martins on 27/07/2021.
//

import UIKit

final class Appearance: NSObject {

    private override init() { }

    static func configure(_ navigationBar: UINavigationBar) {

        let navBarAppearance = UINavigationBarAppearance()

        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: ColorPalete.white.toColor()]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: ColorPalete.white.toColor()]
        navBarAppearance.backgroundColor = ColorPalete.orange.toColor()
        navBarAppearance.buttonAppearance.normal.titleTextAttributes = [.foregroundColor: ColorPalete.white.toColor()]

        navigationBar.prefersLargeTitles = true
        navigationBar.standardAppearance = navBarAppearance
        navigationBar.scrollEdgeAppearance = navBarAppearance
    }
}
