//
//  FeedsUseCase.swift
//  NetworkPlatform
//
//  Created by 권나영 on 2023/02/18.
//

import Domain
import RxSwift

final class FeedsUseCase: Domain.FeedUseCase {
    private let network: FeedNetwork
    private let cache: Cache
    
    init(network: FeedNetwork, cache: Cache) {
        self.network = network
        self.cache = cache
    }
    
    // 배열을 받자!!!
    func feeds(for feeds: [Feed]) -> Observable<[Feed]> {
        let stored = cache.fetchObject(for: feeds).asObservable()
        
        // 캐시 없음
        // 네트워크 통신하고
        let fetched = network.fetchFeeds()
            .flatMap {
                // 캐시 저장
                return self.cache.save(objects: $0)
                    .asObservable()
                    .map(to: [Feed].self)
                // 여기서 concat은 왜필요할까
              //  .concat(Observable.just($0))
            }
        return stored.concat(fetched)
    }
}

struct MapFromNever: Error {}
extension ObservableType where Element == Never {
    func map<T>(to: T.Type) -> Observable<T> {
        return self.flatMap { _ in
            return Observable<T>.error(MapFromNever())
        }
    }
}
