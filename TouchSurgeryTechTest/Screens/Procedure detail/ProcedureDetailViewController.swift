//
//  ProcedureDetailViewController.swift
//  TouchSurgeryTechTest
//
//  Created by Sam Watts on 13/04/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import UIKit

class ProcedureDetailViewController: BaseViewController {

    @available(iOS, unavailable, message: "init() is unavailable, use init(viewModel:) instead")
    override init() { fatalError() }

    private let viewModel: ProcedureDetailViewModel

    init(viewModel: ProcedureDetailViewModel) {
        self.viewModel = viewModel

        super.init()
    }
}
