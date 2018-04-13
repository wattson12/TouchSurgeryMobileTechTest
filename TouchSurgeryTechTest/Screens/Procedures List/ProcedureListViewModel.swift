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

final class ProcedureListViewModel {

    let disposeBag = DisposeBag()

    let procedures: BehaviorRelay<[Procedure]>

    let dataProvider: DataProvider

    init(procedures: [Procedure] = [], dataProvider: DataProvider = URLSession.shared) {
        self.procedures = BehaviorRelay(value: procedures)
        self.dataProvider = dataProvider
    }

    func fetchProcedures() {

        dataProvider
            .fetchResponse(fromURL: .procedures)
            .convert(to: [Procedure].self)
            .observeOn(MainScheduler.instance) //move back to the main thread for observable updates since this is where UI is driven from
            .bind(to: procedures)
            .disposed(by: disposeBag)
    }
}
