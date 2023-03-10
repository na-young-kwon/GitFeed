//
//  FeedNetwork.swift
//  NetworkPlatform
//
//  Created by κΆλμ on 2023/02/18.
//

import Domain
import RxSwift

public final class FeedNetwork {
    private let network: Network<Repository>
    
    init(network: Network<Repository>) {
        self.network = network
    }
    
    public func fetchAllRepo() -> Observable<[Repository]> {
        return network.getItems("users/na-young-kwon/repos")
    }
}
