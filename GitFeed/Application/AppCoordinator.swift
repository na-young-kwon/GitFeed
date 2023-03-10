//
//  AppCoordinator.swift
//  GitFeed
//
//  Created by κΆλμ on 2023/02/21.
//

import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        pushFeedViewController()
    }
    
    func pushFeedViewController() {
        let feedCoordinator = FeedCoordinator(navigationController: navigationController)
        childCoordinators.append(feedCoordinator)
        feedCoordinator.start()
    }
}
