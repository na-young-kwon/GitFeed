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
        
        let controller = UIViewController()
        let navigationController = UINavigationController(rootViewController: controller)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
            controller
        ]
        window.rootViewController = tabBarController
    }
}
