//
//  DetailCoordinator.swift
//  GitFeed
//
//  Created by 권나영 on 2023/02/22.
//

import UIKit
import Domain
import NetworkPlatform

final class DetailCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    private weak var parentCoordinator: Coordinator?
    
    init(parentCoordinator: Coordinator? = nil, navigationController: UINavigationController) {
        self.parentCoordinator = parentCoordinator
        self.navigationController = navigationController
    }
    
    func start() { }
    
    func start(with repo: Repository) {
        let controller = storyboard.instantiateViewController(ofType: DetailViewController.self)
        let viewModel = DetailViewModel(repo: repo, coordinator: self)
        
        controller.viewModel = viewModel
        navigationController.pushViewController(controller, animated: true)
    }
    
    func popDetailCoordinator() {
        parentCoordinator?.removeChildCoordinator(self)
    }
    
    func toCommitDetail(with name: String) {
        let controller = storyboard.instantiateViewController(ofType: CommitHistoryViewController.self)
        let viewModel = CommitHistoryViewModel(repoName: name, useCase: UseCaseProvider().makeCommitUseCase())
        
        controller.viewModel = viewModel
        navigationController.pushViewController(controller, animated: true)
    }
}
