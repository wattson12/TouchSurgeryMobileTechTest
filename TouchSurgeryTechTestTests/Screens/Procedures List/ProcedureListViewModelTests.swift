//
//  ProcedureListViewModelTests.swift
//  TouchSurgeryTechTestTests
//
//  Created by Sam Watts on 13/04/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import XCTest
@testable import TouchSurgeryTechTest
import RxSwift
import RxCocoa

class ProcedureListViewModelTests: XCTestCase {

    var disposeBag: DisposeBag!
    
    override func setUp() {
        super.setUp()

        disposeBag = DisposeBag()
    }
    
    func testInitialProcedureArrayIsSetInObservableValue() {

        let viewModel = ProcedureListViewModel(procedures: [("a", "b"), ("1", "2")])

        XCTAssertEqual(viewModel.procedures.value.map { $0.0 }, ["a", "1"])
        XCTAssertEqual(viewModel.procedures.value.map { $0.1 }, ["b", "2"])
    }
    
}
