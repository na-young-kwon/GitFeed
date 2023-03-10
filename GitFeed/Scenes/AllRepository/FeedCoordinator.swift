//
//  FeedCoordinator.swift
//  GitFeed
//
//  Created by κΆλμ on 2023/02/21.
//

import UIKit
import Domain
import NetworkPlatform

final class FeedCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    private let service = UseCaseProvider()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(ofType: FeedViewController.self)
        
        controller.viewModel = FeedViewModel(useCase: service.makeFeedsUseCase(), coordinator: self)
        navigationController.pushViewController(controller, animated: true)
    }
    
    
    func toDetail(_ repo: Repository) {
        let detailCoordinator = DetailCoordinator(parentCoordinator: self,
                                                  navigationController: navigationController)
        childCoordinators.append(detailCoordinator)
        detailCoordinator.start(with: repo)
    }
}
