//
//  Observable+Conversion.swift
//  TouchSurgeryTechTest
//
//  Created by Sam Watts on 13/04/2018.
//  Copyright © 2018 Sam Watts. All rights reserved.
//

import Foundation
import RxSwift

extension Observable where Element == Data {

    //helper to convert to any decodable type from a data observable (e.g. network response)
    func convert<T: Decodable>(to convertType: T.Type, usingDecoder decoder: JSONDecoder = JSONDecoder()) -> Observable<T> {
        return self.map { data in
            try decoder.decode(convertType, from: data)
        }
    }
}

extension Observable {

    //helper to map to a specific keypath, rather than mapping and operating on data
    func mapToKeypath<Value>(_ keyPath: KeyPath<Element, Value>) -> Observable<Value> {
        return self.map { $0[keyPath: keyPath] }
    }
}
