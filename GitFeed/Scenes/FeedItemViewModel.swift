//
//  FeedItemViewModel.swift
//  GitFeed
//
//  Created by 권나영 on 2023/02/20.
//

import Foundation
import Domain

final class FeedItemViewModel {
    let repo: Repository
    init(repo: Repository) {
        self.repo = repo
    }
}
