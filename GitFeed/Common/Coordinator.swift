//
//  Coordinator.swift
//  GitFeed
//
//  Created by 권나영 on 2023/02/21.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
