//
//  ReusableElement.swift
//  TouchSurgeryTechTest
//
//  Created by Sam Watts on 13/04/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import UIKit

protocol ReusableElement {
    static var reuseIdentifier: String { get }
}

extension UITableViewCell: ReusableElement {

    static var reuseIdentifier: String {
        return "\(String(describing: self))ReuseIdentifier"
    }
}

extension UITableView {

    func registerReusableElement<T: UITableViewCell>(_ type: T.Type) {
        self.register(T.self, forCellReuseIdentifier: type.reuseIdentifier)
    }
}
