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

        let procedures: [Procedure] = [
            Procedure.init(identifier: "a", name: "b", icon: "c"),
            Procedure.init(identifier: "1", name: "2", icon: "3")
        ]
        let viewModel = ProcedureListViewModel(procedures: procedures)

        XCTAssertEqual(viewModel.procedures.value, procedures)
    }

    func testViewModelBindsDataProviderResponseToProcedures() {

        let stubbedDataProvider = StubDataProvider(data: testData(fromFixtureNamed: "procedure_list"))
        let viewModel = ProcedureListViewModel(dataProvider: stubbedDataProvider)

        let viewModelComplete = expectation(description: "view model fetch complete")
        viewModel
            .procedures
            .skip(1) //ignore the initial value
            .subscribe(onNext: { procedures in
                XCTAssertEqual(procedures.count, 10)
                viewModelComplete.fulfill()
            })
            .disposed(by: disposeBag)

        viewModel.fetchProcedures()

        waitForExpectations(timeout: 0.1)
    }

    func testViewModelConvertsFailedResponsesToEmptyArrayBeforeBinding() {

        let stubbedDataProvider = ErrorDataProvider()
        let viewModel = ProcedureListViewModel(dataProvider: stubbedDataProvider)

        let viewModelComplete = expectation(description: "view model fetch complete")
        viewModel
            .procedures
            .skip(1) //ignore the initial value
            .subscribe(onNext: { procedures in
                XCTAssertTrue(procedures.isEmpty)
                viewModelComplete.fulfill()
            })
            .disposed(by: disposeBag)

        viewModel.fetchProcedures()

        waitForExpectations(timeout: 0.1)
    }
    
}
