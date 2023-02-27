//
//  APIProvider.swift
//  Domain
//
//  Created by 권나영 on 2023/02/24.
//

import Foundation
import Alamofire
import Domain
import RxAlamofire
import RxSwift

final class APIProvider<T: Decodable> {
    private let endPoint: String
    private let scheduler: ConcurrentDispatchQueueScheduler
    
    init(_ endPoint: String) {
        self.endPoint = endPoint
        self.scheduler = ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1))
    }
    
    func getItems(_ path: String) -> Observable<[T]> {
        let absolutePath = "\(endPoint)/\(path)"
        return RxAlamofire
            .data(.get, absolutePath)
            .debug()
            .observe(on: scheduler)
            .map({ data -> [T] in
                return try JSONDecoder().decode([T].self, from: data)
            })
    }

    func getItem(_ path: String, itemId: String) -> Observable<T> {
        let absolutePath = "\(endPoint)/\(path)/\(itemId)"
        return RxAlamofire
            .data(.get, absolutePath)
            .debug()
            .observe(on: scheduler)
            .map({ data -> T in
                return try JSONDecoder().decode(T.self, from: data)
            })
    }
}
