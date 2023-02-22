//
//  DetailCoordinator.swift
//  GitFeed
//
//  Created by 권나영 on 2023/02/22.
//

import UIKit

final class DetailCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    private weak var parentCoordinator: Coordinator?
    
    var navigationController: UINavigationController
    
    init(parentCoordinator: Coordinator? = nil, navigationController: UINavigationController) {
        self.parentCoordinator = parentCoordinator
        self.navigationController = navigationController
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(ofType: DetailViewController.self)
        controller.coordinator = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    func popDetailCoordinator() {
        parentCoordinator?.removeChildCoordinator(self)
    }
}
