//
//  ProcedureListTableViewController.swift
//  TouchSurgeryTechTest
//
//  Created by Sam Watts on 13/04/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import UIKit

class ProcedureListTableViewController: BaseViewController {

    @available(iOS, unavailable, message: "init() is unavailable, use init(viewModel:) instead")
    override init() { fatalError() }

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .background
        tableView.registerReusableElement(ProcedureTableViewCell.self)
        tableView.tableFooterView = UIView() //empty footer to remote empty cell lines after content
        return tableView
    }()

    let viewModel: ProcedureListViewModel

    init(viewModel: ProcedureListViewModel) {
        self.viewModel = viewModel

        super.init()
    }

    override func loadView() {
        self.view = tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension ProcedureListTableViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.procedures.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProcedureTableViewCell.reuseIdentifier, for: indexPath) as? ProcedureTableViewCell else {
            fatalError("Unregistered cell used on table view")
        }

        let procedure = viewModel.procedures.value[indexPath.row]
        cell.textLabel?.text = procedure.0

        return cell
    }
}
