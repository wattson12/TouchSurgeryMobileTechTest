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

final class ProcedureDetailViewModel {

    let disposeBag = DisposeBag()

    let procedure: BehaviorRelay<Procedure>
    let procedureDetail: PublishSubject<ProcedureDetail> = PublishSubject()

    let dataProvider: DataProvider

    init(procedure: Procedure, dataProvider: DataProvider = URLSession.shared) {
        self.procedure = BehaviorRelay(value: procedure)
        self.dataProvider = dataProvider
    }

    func fetchProcedureDetail() {
        guard let url = URL.procedureDetail(forID: procedure.value.identifier) else {
            print("Not fetching detail because of invalid URL")
            return
        }

        //create empty detail here to avoid implicitly capturing self
        let emptyProcedureDetail = ProcedureDetail(emptyDetailFromProcedure: procedure.value)

        dataProvider
            .fetchResponse(fromURL: url)
            .convert(to: ProcedureDetail.self)
            .catchErrorJustReturn(emptyProcedureDetail) //basic error handling (no image but we still have a name)
            .observeOn(MainScheduler.instance) //move back to the main thread for observable updates since this is where UI is driven from
            .bind(to: procedureDetail)
            .disposed(by: disposeBag)
    }
}
