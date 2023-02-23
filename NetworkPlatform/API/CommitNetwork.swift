//
//  CommitNetwork.swift
//  NetworkPlatform
//
//  Created by 권나영 on 2023/02/23.
//

import Domain
import RxSwift

public final class CommitNetwork {
    private let network: Network<Commit>
    
    init(network: Network<Commit>) {
        self.network = network
    }
    
    public func fetchCommits(for repoName: String) -> Observable<[Commit]> {
        return network.getItems("repos/\(repoName)/commits")
    }
}
