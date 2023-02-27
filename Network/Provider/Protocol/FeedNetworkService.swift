//
//  FeedNetworkService.swift
//  Domain
//
//  Created by 권나영 on 2023/02/24.
//

import Foundation
import RxSwift

protocol FeedNetworkService {
    func fetchAllRepo() -> Observable<[Repository]>
    func fetchCommits(for repoName: String) -> Observable<[Commit]>
}
