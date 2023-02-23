//
//  DetailViewModel.swift
//  GitFeed
//
//  Created by 권나영 on 2023/02/22.
//

import Foundation
import Domain
import RxSwift
import RxCocoa

final class DetailViewModel: ViewModelType {
    private let repo: Repository
    private let coordinator: DetailCoordinator
    
    struct Input {
        let viewWillAppear: Driver<Void>
        let commitHistoryTrigger: Driver<Void>
    }
    
    struct Output {
        let repo: Driver<Repository>
        let showCommit: Driver<Void>
    }
    
    init(repo: Repository, coordinator: DetailCoordinator) {
        self.repo = repo
        self.coordinator = coordinator
    }
    
    func popDetailCoordinator() {
        coordinator.popDetailCoordinator()
    }
    
    func transform(input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        let repo = Observable.just(repo)
            .asDriverOnErrorJustComplete()
                
        let showCommit = input.commitHistoryTrigger
            .do { [weak self] _ in
                self?.coordinator.toCommitDetail(with: (self?.repo.fullName)!)
            }
            
        return Output(repo: repo,
                      showCommit: showCommit)
    }
}
