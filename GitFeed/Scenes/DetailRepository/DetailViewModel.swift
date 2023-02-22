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
    
    struct Input {
        let viewWillAppear: Driver<Void>
    }
    
    struct Output {
        let repo: Driver<Repository>
    }
    
    init(repo: Repository, useCase: FeedUseCase) {
        self.repo = repo
        self.useCase = useCase
    }
    
    func transform(input: Input) -> Output {
        let repo = Observable.just(repo)
            .asDriverOnErrorJustComplete()
            
        return Output(repo: repo)
    }
}
