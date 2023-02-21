//
//  FeedNavigator.swift
//  GitFeed
//
//  Created by 권나영 on 2023/02/20.
//

import UIKit
import Domain

protocol FeedNavigator {
    func toFeed(_ feed: Feed)
    func toFeeds()
}

class DefaultFeedNavigator: FeedNavigator {
    private let storyBoard: UIStoryboard
    private let navigationController: UINavigationController
    private let services: UseCaseProvider
    
    init(storyBoard: UIStoryboard, navigationController: UINavigationController, services: UseCaseProvider) {
        self.storyBoard = storyBoard
        self.navigationController = navigationController
        self.services = services
    }
    
    func toFeed(_ feed: Feed) {
        
    }
    
    func toFeeds() {
        let controller = storyBoard.instantiateViewController(ofType: FeedViewController.self)
//        controller.viewModel = FeedViewModel(useCase: services.makeFeedsUseCase(),
//                                             navigator: self)
        
        navigationController.pushViewController(controller, animated: true)
    }
}
