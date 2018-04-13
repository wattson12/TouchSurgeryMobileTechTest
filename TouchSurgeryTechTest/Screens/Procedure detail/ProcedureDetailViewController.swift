//
//  ProcedureDetailViewController.swift
//  TouchSurgeryTechTest
//
//  Created by Sam Watts on 13/04/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class ProcedureDetailViewController: BaseViewController {

    @available(iOS, unavailable, message: "init() is unavailable, use init(viewModel:) instead")
    override init() { fatalError() }

    private let viewModel: ProcedureDetailViewModel

    let detailView: ProcedureDetailView = ProcedureDetailView()

    init(viewModel: ProcedureDetailViewModel) {
        self.viewModel = viewModel

        super.init()
    }

    override func loadView() {
        self.view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBindings()
    }

    private func setupBindings() {

        //setup table from phases
        viewModel
            .procedureDetail
            .map { $0.phases }
            .bind(to: detailView.tableView.rx.items(cellIdentifier: ProcedureTableViewCell.reuseIdentifier)) { (_, phase: Phase, cell: ProcedureTableViewCell) in
                cell.nameLabel.text = phase.name
                cell.iconImageView.kf.setImage(with: URL(string: phase.icon))
            }
            .disposed(by: disposeBag)

        //setup bindings for both detail and procedure to get an immediate title
        viewModel
            .procedure
            .observeOn(MainScheduler.instance)
            .map { $0.name }
            .bind(to: detailView.titleLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel
            .procedureDetail
            .map { $0.name }
            .bind(to: detailView.titleLabel.rx.text)
            .disposed(by: disposeBag)

        //load image from card once detail is loaded
        viewModel
            .procedureDetail
            .map { $0.card }
            .subscribe(onNext: { [unowned self] card in
                self.detailView.imageView.kf.setImage(with: URL(string: card))
            })
            .disposed(by: disposeBag)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        viewModel.fetchProcedureDetail()
    }
}
