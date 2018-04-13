//
//  StubDataProvider.swift
//  TouchSurgeryTechTestTests
//
//  Created by Sam Watts on 13/04/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import Foundation
@testable import TouchSurgeryTechTest
import RxSwift
import RxCocoa

struct StubDataProvider: DataProvider {

    let data: Data

    func fetchResponse(fromURL url: URL) -> Observable<Data> {
        return Observable.just(data)
    }
}

struct ErrorDataProvider: DataProvider {

    let error: Error = NSError(domain: #file, code: #line, userInfo: nil)

    func fetchResponse(fromURL url: URL) -> Observable<Data> {
        return Observable.error(error)
    }
}

