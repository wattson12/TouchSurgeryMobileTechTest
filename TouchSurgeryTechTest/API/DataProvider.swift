//
//  DataProvider.swift
//  TouchSurgeryTechTest
//
//  Created by Sam Watts on 13/04/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

//this is an abstraction around URLSession which will help testing view models
protocol DataProvider {
    func fetchResponse(fromURL url: URL) -> Observable<Data>
}

//URLSession is the easiest way, build on existing Rx extensions to add conformance
extension URLSession: DataProvider {

    func fetchResponse(fromURL url: URL) -> Observable<Data> {
        let urlRequest = URLRequest(url: url)

        return self.rx
            .data(request: urlRequest)
    }
}
