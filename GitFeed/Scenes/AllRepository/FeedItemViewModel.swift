//
//  FeedItemViewModel.swift
//  GitFeed
//
//  Created by κΆλμ on 2023/02/20.
//

import Foundation
import Domain

final class FeedItemViewModel {
    let repo: Repository
    
    init(repo: Repository) {
        self.repo = repo
    }
}
