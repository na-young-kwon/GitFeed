//
//  Application.swift
//  GitFeed
//
//  Created by 권나영 on 2023/02/17.
//

import UIKit

final class Application {
    static let shared = Application()
    
    private init() {
        
    }
    
    func configureMainInterface(in window: UIWindow) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let controller = UIViewController()
        let navigationController = UINavigationController(rootViewController: controller)
        
        window.rootViewController = navigationController
    }
}
