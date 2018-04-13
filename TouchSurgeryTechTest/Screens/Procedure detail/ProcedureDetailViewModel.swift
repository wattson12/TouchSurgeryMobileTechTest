//
//  ProcedureDetailViewModel.swift
//  TouchSurgeryTechTest
//
//  Created by Sam Watts on 13/04/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

typealias ProcedureDetail = String

final class ProcedureDetailViewModel {

    let disposeBag = DisposeBag()

    private let procedure: Procedure
    let procedureDetail: PublishSubject<ProcedureDetail> = PublishSubject()

    let dataProvider: DataProvider

    init(procedure: Procedure, dataProvider: DataProvider = URLSession.shared) {
        self.procedure = procedure
        self.dataProvider = dataProvider
    }

    func fetchProcedureDetail() {

        dataProvider
            .fetchResponse(fromURL: .procedures)
            .convert(to: [Procedure].self)
            .catchErrorJustReturn([]) //very simple error handling
            .observeOn(MainScheduler.instance) //move back to the main thread for observable updates since this is where UI is driven from
            .map { $0.description }
            .bind(to: procedureDetail)
            .disposed(by: disposeBag)
    }
}
