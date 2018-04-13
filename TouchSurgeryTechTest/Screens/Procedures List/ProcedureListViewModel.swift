//
//  ProcedureListViewModel.swift
//  TouchSurgeryTechTest
//
//  Created by Sam Watts on 13/04/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

typealias Procedure = (String, String)

final class ProcedureListViewModel {

    let disposeBag = DisposeBag()

    let procedures: BehaviorRelay<[Procedure]>

    init(procedures: [Procedure] = []) {
        self.procedures = BehaviorRelay(value: procedures)
    }
}
