//
//  CommitHistoryViewModel.swift
//  Pods
//
//  Created by 권나영 on 2023/02/23.
//

import Foundation
import Domain
import RxSwift
import RxCocoa

final class CommitHistoryViewModel: ViewModelType {
    private let repoName: String
    private let useCase: CommitUseCase
    // TODO: - pop할때 인스턴스 여러개 쌓이는지 학인하고 후에 추가하기
    // 코디네이터 필요?
    
    struct Input {
        let trigger: Driver<Void>
    }
    
    struct Output {
        let fetching: Driver<Bool>
        let commits: Driver<[CommitItemViewModel]>
    }
    
    init(repoName: String, useCase: CommitUseCase) {
        self.repoName = repoName
        self.useCase = useCase
    }
    
    func transform(input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        let fetching = activityIndicator.asDriver()
        
        let commits = input.trigger.flatMapLatest {
       // TODO: -  여기 weak self 해줘야함?
            return self.useCase.commits(for: self.repoName)
                .trackActivity(activityIndicator)
                .asDriverOnErrorJustComplete()
                .map { commits in
                    commits.map { CommitItemViewModel(with: $0) }
                }
        }
            return Output(fetching: fetching,
                          commits: commits)
    }
}
