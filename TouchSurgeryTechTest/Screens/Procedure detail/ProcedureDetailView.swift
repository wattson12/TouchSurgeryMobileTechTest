//
//  ProcedureDetailView.swift
//  TouchSurgeryTechTest
//
//  Created by Sam Watts on 13/04/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import UIKit

class ProcedureDetailView: BaseView {

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .detailImageViewBackground
        return imageView
    }()

    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .detailTitle
        titleLabel.font = .detailTitle
        titleLabel.textAlignment = .center
        return titleLabel
    }()

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .background
        tableView.registerReusableElement(ProcedureTableViewCell.self)
        tableView.tableFooterView = UIView() //empty footer to remote empty cell lines after content
        return tableView
    }()

    override init() {
        super.init()

        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.addSubview(tableView)

        setupConstaints()
    }

    private func setupConstaints() {

        //image view pinned to top and kept at a 16:9 ratio
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),

            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 9 / 16)
        ])

        //title label is centered just below image
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        ])

        //and table view takes up the remaining space
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: titleLabel.lastBaselineAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
