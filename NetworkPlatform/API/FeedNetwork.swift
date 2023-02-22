//
//  FeedNetwork.swift
//  NetworkPlatform
//
//  Created by 권나영 on 2023/02/18.
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
    
    // 추후 추가 - 개별 아이템 가져오기
//    public func fetchFeed() -> Observable<Feed> {
//        return network.getItem(<#T##path: String##String#>, itemId: <#T##String#>)
//    }
}
