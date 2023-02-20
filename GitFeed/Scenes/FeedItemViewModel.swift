//
//  FeedItemViewModel.swift
//  GitFeed
//
//  Created by 권나영 on 2023/02/20.
//

import Foundation
import Domain

final class FeedItemViewModel {
    let feed: Feed
    init(feed: Feed) {
        self.feed = feed
    }
}
