//
//  AppCoordinator.swift
//  GitFeed
//
//  Created by 권나영 on 2023/02/21.
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
        let feedCoordinator = FeedCoordinator(parentCoordinator: self,
                                              navigationController: navigationController)
        childCoordinators.append(feedCoordinator)
        feedCoordinator.start()
    }
}
