//
//  DefaultFeedUseCase.swift
//  Domain
//
//  Created by 권나영 on 2023/02/24.
//

import Foundation
import RxSwift

final class DefaultFeedUseCase: FeedRepository {
    private let feedRepository: FeedRepository
    
    init(feedRepository: FeedRepository) {
        self.feedRepository = feedRepository
    }
    
    func repositories() -> RxSwift.Observable<[Repository]> {
        return feedRepository.repositories()
    }
    
    func commits(for fullName: String) -> RxSwift.Observable<[Commit]> {
        return feedRepository.commits(for: fullName)
    }
}
