//
//  ProcedureDetailViewModelTests.swift
//  TouchSurgeryTechTestTests
//
//  Created by Sam Watts on 13/04/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import XCTest
@testable import TouchSurgeryTechTest
import RxSwift
import RxCocoa

class ProcedureDetailViewModelTests: XCTestCase {
    
    var disposeBag: DisposeBag!
    var procedure: Procedure!

    override func setUp() {
        super.setUp()

        disposeBag = DisposeBag()
        procedure = Procedure(identifier: "identifier", name: "name", icon: "icon")
    }

    func testProcedureIsObservableFromInitialValue() {
        let viewModel = ProcedureDetailViewModel(procedure: procedure)

        XCTAssertEqual(viewModel.procedure.value, procedure)
    }

    func testDetailResponseIsBoundToObservable() {

        let stubbedDataProvider = StubDataProvider(data: testData(fromFixtureNamed: "procedure_detail"))
        let viewModel = ProcedureDetailViewModel(procedure: procedure, dataProvider: stubbedDataProvider)

        let viewModelComplete = expectation(description: "view model fetch complete")

        viewModel
            .procedureDetail
            .subscribe(onNext: { detail in
                XCTAssertEqual(detail.identifier, "procedure-TSC_AnkleORIF")
                XCTAssertEqual(detail.phases.count, 1)
                viewModelComplete.fulfill()
            })
            .disposed(by: disposeBag)

        viewModel.fetchProcedureDetail()

        waitForExpectations(timeout: 0.1)
    }

    func testEmptyDetailIsUsedWhenRequestFails() {

        let stubbedDataProvider = ErrorDataProvider()
        let viewModel = ProcedureDetailViewModel(procedure: procedure, dataProvider: stubbedDataProvider)

        let viewModelComplete = expectation(description: "view model fetch complete")

        viewModel
            .procedureDetail
            .subscribe(onNext: { detail in
                XCTAssertEqual(detail.identifier, self.procedure.identifier)
                XCTAssertTrue(detail.phases.isEmpty)
                viewModelComplete.fulfill()
            })
            .disposed(by: disposeBag)

        viewModel.fetchProcedureDetail()

        waitForExpectations(timeout: 0.1)
    }
}
