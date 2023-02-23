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
    private let useCase: FeedUseCase
    private let coordinator: DetailCoordinator
    
    struct Input {
        let viewWillAppear: Driver<Void>
        let commitHistoryTrigger: Driver<Void>
    }
    
    struct Output {
        let repo: Driver<Repository>
        let showCommit: Driver<Void>
    }
    
    init(repo: Repository, useCase: FeedUseCase, coordinator: DetailCoordinator) {
        self.repo = repo
        self.useCase = useCase
        self.coordinator = coordinator
    }
    
    func popDetailCoordinator() {
        coordinator.popDetailCoordinator()
    }
    
    func transform(input: Input) -> Output {
        let repo = Observable.just(repo)
            .asDriverOnErrorJustComplete()
            
        let showCommit = input.commitHistoryTrigger
            .do(onNext: coordinator.toCommitDetail)
            
        return Output(repo: repo,
                      showCommit: showCommit)
    }
}
