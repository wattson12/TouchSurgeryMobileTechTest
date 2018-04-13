//
//  ProcedureListTableViewControllerAppCoordinatorDelegate.swift
//  TouchSurgeryTechTest
//
//  Created by Sam Watts on 13/04/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import UIKit

protocol ProcedureListTableViewControllerAppCoordinatorDelegate: AnyObject {

    func procedureWasSelected(_ procedure: Procedure, fromViewController viewController: UIViewController)
}

extension AppCoordinator: ProcedureListTableViewControllerAppCoordinatorDelegate {

    func procedureWasSelected(_ procedure: Procedure, fromViewController viewController: UIViewController) {

        let procedureDetailViewController = ProcedureDetailViewController(viewModel: ProcedureDetailViewModel(procedure: procedure))
        viewController.navigationController?.pushViewController(procedureDetailViewController, animated: true)
    }
}
