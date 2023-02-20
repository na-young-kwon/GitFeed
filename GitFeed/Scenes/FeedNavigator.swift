//
//  FeedNavigator.swift
//  GitFeed
//
//  Created by 권나영 on 2023/02/20.
//

import Foundation
import Domain

protocol FeedNavigator {
    func toFeed(_ feed: Feed)
    func toFeeds()
}

class DefaultFeedsNavigator: FeedNavigator {
    func toFeed(_ feed: Feed) {
        
    }
    
    func toFeeds() {
        
    }
}
