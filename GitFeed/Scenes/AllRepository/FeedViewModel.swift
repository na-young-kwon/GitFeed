//
//  FeedViewModel.swift
//  GitFeed
//
//  Created by 권나영 on 2023/02/19.
//

import Foundation
import Domain
import RxSwift
import RxCocoa

final class FeedViewModel: ViewModelType {
    struct Input {
        let trigger: Driver<Void>
        let selection: Driver<IndexPath>
    }
    struct Output {
        let fetching: Driver<Bool>
        let repos: Driver<[FeedItemViewModel]>
        let selectedRepo: Driver<Repository>
        let error: Driver<Error>
    }
    private let useCase: FeedUseCase
    private let coordinator: FeedCoordinator
    
    init(useCase: FeedUseCase, coordinator: FeedCoordinator) {
        self.useCase = useCase
        self.coordinator = coordinator
    }
    
    func transform(input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        let errorTracker = ErrorTracker()
        // flatMapLatest 왜쓰는거지
        // MapLatest는 왜인지 이유를 알겠음 - 가장 마지막 트리거를 남기기 위해서
        // 근데 flat은 왜 해줘야 하는지?
        let repos = input.trigger.flatMapLatest {
            return self.useCase.repositories()
                .trackActivity(activityIndicator)
                .trackError(errorTracker)
                .asDriverOnErrorJustComplete()
                .map { repos in
                    repos.map { FeedItemViewModel(repo: $0) }
                }
        }
        let fetching = activityIndicator.asDriver()
        let errors = errorTracker.asDriver()
        let selectedRepo = input.selection
            .withLatestFrom(repos) { (indexPath, repos) -> Repository in
                return repos[indexPath.row].repo
            }
//            .do { _ in
//                self.coordinator.toDetailView()
//            }
        // 이건 왜 안되는거지?..?
            .do(onNext: coordinator.detail)
        
        return Output(fetching: fetching,
                      repos: repos,
                      selectedRepo: selectedRepo,
                      error: errors)
    }
}
