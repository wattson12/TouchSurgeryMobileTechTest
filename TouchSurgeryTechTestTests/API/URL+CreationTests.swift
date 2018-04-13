//
//  URL+CreationTests.swift
//  TouchSurgeryTechTestTests
//
//  Created by Sam Watts on 13/04/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import XCTest
@testable import TouchSurgeryTechTest

class URL_CreationTests: XCTestCase {
    
    func testProceduresURLValue() {
        let proceduresURL = URL.procedures
        XCTAssertEqual(proceduresURL.absoluteString, "https://staging.touchsurgery.com/tech-test/procedures")
    }

    func testProceduresURLForValidIdentifier() {
        let procedureDetailURL = URL.procedureDetail(forID: "id")
        XCTAssertEqual(procedureDetailURL?.absoluteString, "https://staging.touchsurgery.com/tech-test/procedures/id")
    }

    func testIdentifierIsEscaped() {
        let procedureDetailURL = URL.procedureDetail(forID: "spaces are escaped")
        XCTAssertEqual(procedureDetailURL?.absoluteString, "https://staging.touchsurgery.com/tech-test/procedures/spaces%20are%20escaped")
    }
    
}
