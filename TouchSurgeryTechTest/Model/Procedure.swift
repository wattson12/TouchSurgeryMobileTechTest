//
//  Procedure.swift
//  TouchSurgeryTechTest
//
//  Created by Sam Watts on 13/04/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import Foundation

struct Procedure: Decodable, Equatable {

    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case icon
    }

    let identifier: String
    let name: String
    let icon: String
}
