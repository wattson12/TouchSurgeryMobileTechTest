//
//  ReusableElementTests.swift
//  TouchSurgeryTechTestTests
//
//  Created by Sam Watts on 13/04/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import XCTest
@testable import TouchSurgeryTechTest

class ReusableElementTests: XCTestCase {
    
    func testTableViewCellSubclassGetsAReuseIdentifier() {
        class TestClass: UITableViewCell { }

        XCTAssertTrue(TestClass.reuseIdentifier.contains("TestClass"))
        XCTAssertTrue(TestClass.reuseIdentifier.contains("ReuseIdentifier"))
    }
    
}
