//
//  CommitUseCase.swift
//  NetworkPlatform
//
//  Created by 권나영 on 2023/02/23.
//

import Domain
import RxSwift

final class CommitUseCase: Domain.CommitUseCase {
    private let network: CommitNetwork
    
    init(network: CommitNetwork) {
        self.network = network
    }
    
    func commits(for fullName: String) -> Observable<[Commit]> {
        return network.fetchCommits(for: fullName)
    }
}
