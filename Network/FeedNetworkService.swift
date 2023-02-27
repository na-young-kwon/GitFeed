//
//  DefaultFeedNetworkService.swift
//  Domain
//
//  Created by 권나영 on 2023/02/24.
//

import Foundation
import RxSwift

final class FeedNetworkService {
    let apiProvider: APIProvider
    
    init(apiProvider: APIProvider) {
        self.apiProvider = apiProvider
    }
    
    func fetchAllRepo() -> Observable<[Repository]> {
        return network.getItems("users/na-young-kwon/repos")
    }
    
    func fetchCommits(for repoName: String) -> Observable<[Commit]> {
        return network.getItems("repos/\(repoName)/commits")
    }
}
