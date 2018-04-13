//
//  URL+Creation.swift
//  TouchSurgeryTechTest
//
//  Created by Sam Watts on 13/04/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import Foundation

extension URL {

    static var procedures: URL {
        guard let proceduresURL = URL(string: "https://staging.touchsurgery.com/tech-test/procedures") else {
            fatalError("Unable to create procedures URL from hard coded value")
        }

        return proceduresURL
    }

    static func procedureDetail(forID identifier: String) -> URL? {
        guard
            let escapedIdentifier = identifier.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed),
            let procedureDetailURL = URL(string: "https://staging.touchsurgery.com/tech-test/procedures/\(escapedIdentifier)")
        else {
            print("Unable to create URL from identifier: \(identifier)")
            return nil
        }

        return procedureDetailURL
    }
}
