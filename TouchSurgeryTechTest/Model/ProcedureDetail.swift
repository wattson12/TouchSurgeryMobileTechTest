//
//  ProcedureDetail.swift
//  TouchSurgeryTechTest
//
//  Created by Sam Watts on 13/04/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import Foundation

struct Phase: Decodable, Equatable {
    let name: String
    let icon: String
}

struct ProcedureDetail: Decodable, Equatable {

    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case card
        case phases
    }

    let identifier: String
    let name: String
    let card: String
    let phases: [Phase]
}

extension ProcedureDetail {

    init(emptyDetailFromProcedure procedure: Procedure) {
        self.init(identifier: procedure.identifier, name: procedure.name, card: "", phases: [])
    }
}
