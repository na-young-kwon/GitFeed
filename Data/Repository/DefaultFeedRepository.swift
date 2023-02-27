//
//  DefaultFeedRepository.swift
//  Domain
//
//  Created by 권나영 on 2023/02/24.
//

import Domain
import RxSwift

final class DefaultFeedRepository: FeedRepository {
    private let network: FeedNetwork
    
    init(network: FeedNetwork) {
        self.network = network
    }
    
    func repositories() -> Observable<[Repository]> {
        return network.fetchAllRepo()
    }
}
