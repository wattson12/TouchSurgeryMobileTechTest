//
//  AppCoordinatorTests.swift
//  TouchSurgeryTechTestTests
//
//  Created by Sam Watts on 13/04/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import XCTest
@testable import TouchSurgeryTechTest

class AppCoordinatorTests: XCTestCase {
    
    func testWindowIsMadeKeyOnStart() {
        let window = UIWindow()
        XCTAssertFalse(window.isKeyWindow)

        let appCoordinator = AppCoordinator(window: window)
        appCoordinator.start()

        XCTAssertTrue(window.isKeyWindow)
    }
}
