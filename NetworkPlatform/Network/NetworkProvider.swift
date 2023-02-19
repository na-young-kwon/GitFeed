//
//  NetworkProvider.swift
//  NetworkPlatform
//
//  Created by 권나영 on 2023/02/18.
//

import Domain

final class NetworkProvider {
    private let apiEndpoint: String
    
    public init() {
        apiEndpoint = "https://api.github.com"
    }
    
    public func makeFeedsUseCase() -> FeedNetwork {
        let network = Network<Feed>(apiEndpoint)
        return FeedNetwork(network: network)
    }
}