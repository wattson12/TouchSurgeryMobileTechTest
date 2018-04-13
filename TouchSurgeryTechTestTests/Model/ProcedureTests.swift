//
//  ProcedureTests.swift
//  TouchSurgeryTechTestTests
//
//  Created by Sam Watts on 13/04/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import XCTest
@testable import TouchSurgeryTechTest

class ProcedureTests: XCTestCase {
    
    func testProcedureCanBeMappedFromJSON() {
        do {
            let mappedProcedure = try JSONDecoder().decode(Procedure.self, from: testData(fromFixtureNamed: "single_procedure"))

            XCTAssertEqual(mappedProcedure.identifier, "procedure-TSC_CemCup")
            XCTAssertEqual(mappedProcedure.name, "Cemented Hip Cup")
            XCTAssertEqual(mappedProcedure.icon, "https://content.touchsurgery.com/5d/21/5d2178b3c0c2ed2d61197bc3f7f8c3940747af70e99ab51c2058fb55fe12698c?Expires=1523710959&Signature=mP1yH0ubkziCsMjsZnBuWB~BcunhImmos4JlFAsf6UWryYkik9oMcVkv3OyGtfCHBhhemD3Rz4xOr7Uj21giUk31EDyfPv7jEgbc1ypq9wQleNUTt1GFcDXNStfiu9j5uu4gVchy3jkUeBdpNm~JkOutzEX6qEjxx4K2J9sgLZXonvXgIhthgtjz6fKBiXDRXNUGChhIdK7zN5RUfR-khif2fFnzrbsWmEBQJ-VsJJUvqpC7C5iWqVCW0jTEEFttJMwf7UxZ2vm~vEmMnCgA7~X6on1XeOknGE1WxtRMGh4akVbYjGCkqHzdX7UHxcgRK2lgCHUZuYbMU7xdqN~KaA__&Key-Pair-Id=APKAISEZV3CS3QKJL3CQ")
        } catch {
            XCTFail("Unexpected decoding error: \(error)")
        }
    }

    func testProcedureArrayCanBeMappedFromJSON() {
        do {
            let mappedProcedures = try JSONDecoder().decode([Procedure].self, from: testData(fromFixtureNamed: "procedure_list"))
            XCTAssertEqual(mappedProcedures.count, 10)
        } catch {
            XCTFail("Unexpected decoding error: \(error)")
        }
    }
    
}
