//
//  FeedsUseCase.swift
//  NetworkPlatform
//
//  Created by κΆλμ on 2023/02/18.
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
    
    func repositories() -> Observable<[Repository]> {
        return network.fetchAllRepo()
    }
}
