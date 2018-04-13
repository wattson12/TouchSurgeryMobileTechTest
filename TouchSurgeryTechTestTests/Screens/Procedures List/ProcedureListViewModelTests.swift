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
    
}
