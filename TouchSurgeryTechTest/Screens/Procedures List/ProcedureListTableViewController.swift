//
//  ProcedureListTableViewController.swift
//  TouchSurgeryTechTest
//
//  Created by Sam Watts on 13/04/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import UIKit
import Kingfisher
import RxSwift
import RxCocoa

class ProcedureListTableViewController: BaseViewController {

    @available(iOS, unavailable, message: "init() is unavailable, use init(viewModel:coordinatorDelegate:) instead")
    override init() { fatalError() }

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .background
        tableView.registerReusableElement(ProcedureTableViewCell.self)
        tableView.tableFooterView = UIView() //empty footer to remote empty cell lines after content
        return tableView
    }()

    private let viewModel: ProcedureListViewModel
    private weak var coordinatorDelegate: ProcedureListTableViewControllerAppCoordinatorDelegate?

    init(viewModel: ProcedureListViewModel, coordinatorDelegate: ProcedureListTableViewControllerAppCoordinatorDelegate) {
        self.viewModel = viewModel
        self.coordinatorDelegate = coordinatorDelegate

        super.init()

        self.title = L10n.ProcedureList.title
    }

    override func loadView() {
        self.view = tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBindings()
    }

    private func setupBindings() {

        viewModel
            .procedures
            .bind(to: tableView.rx.items(cellIdentifier: ProcedureTableViewCell.reuseIdentifier)) { (_, procedure: Procedure, cell: ProcedureTableViewCell) in
                cell.nameLabel.text = procedure.name
                cell.iconImageView.kf.setImage(with: URL(string: procedure.icon))
            }
            .disposed(by: disposeBag)

        tableView.rx
            .modelSelected(Procedure.self)
            .subscribe(onNext: { [unowned self] selectedProcedure in
                self.coordinatorDelegate?.procedureWasSelected(selectedProcedure, fromViewController: self)
            })
            .disposed(by: disposeBag)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viewModel.fetchProcedures()
    }
}
