//
//  AppCoordinator.swift
//  TouchSurgeryTechTest
//
//  Created by Sam Watts on 13/04/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import UIKit

final class AppCoordinator {

    private let window: UIWindow

    init(window: UIWindow = UIWindow(frame: UIScreen.main.bounds)) {
        self.window = window
        window.backgroundColor = .background
    }

    func start() {
        let procedureListViewController = ProcedureListTableViewController(viewModel: ProcedureListViewModel(), coordinatorDelegate: self)
        let rootNavigationController = UINavigationController(rootViewController: procedureListViewController)

        window.rootViewController = rootNavigationController

        window.makeKeyAndVisible()
    }
}
