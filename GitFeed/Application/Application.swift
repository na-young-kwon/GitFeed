//
//  Application.swift
//  GitFeed
//
//  Created by 권나영 on 2023/02/17.
//

import UIKit
import Domain
import NetworkPlatform

final class Application {
    static let shared = Application()
    
    private let networkUseCaseProvider: Domain.UseCaseProvider
    
    private init() {
        self.networkUseCaseProvider = NetworkPlatform.UseCaseProvider()
    }
    
    func configureMainInterface(in window: UIWindow) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let navigationController = UINavigationController()
//        navigationController.tabBarItem = UITabBarItem(title: "Network",
//                image: UIImage(named: "Toolbox"),
//                selectedImage: nil)
        
        let feedNavigator = DefaultFeedNavigator(storyBoard: storyboard,
                                                 navigationController: navigationController,
                                                 services: networkUseCaseProvider)
//        let tabBarController = UITabBarController()
//        tabBarController.viewControllers = [
//            navigationController
//        ]
        window.rootViewController = navigationController
        
        feedNavigator.toFeeds()
    }
}
