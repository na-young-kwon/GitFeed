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
        let feeds: Driver<[FeedItemViewModel]>
        let selectedFeed: Driver<Feed>
//        let error: Driver<Error>
    }
    private let useCase: FeedUseCase
    
    init(useCase: FeedUseCase) {
        self.useCase = useCase
    }
    
    func transform(input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        
        // flatMapLatest 왜쓰는거지
        // MapLatest는 왜인지 이유를 알겠음 - 가장 마지막 트리거를 남기기 위해서
        // 근데 flat은 왜 해줘야 하는지?
        let feeds = input.trigger.flatMapLatest {
            return self.useCase.feeds(for: [])
                .trackActivity(activityIndicator)
                .asDriverOnErrorJustComplete()
                .map { feeds in
                    feeds.map { FeedItemViewModel(feed: $0) }
                }
        }
        let fetching = activityIndicator.asDriver()
        let selectedFeed = input.selection
            .withLatestFrom(feeds) { (indexPath, feeds) -> Feed in
                return feeds[indexPath.row].feed
            }
        
        return Output(fetching: fetching, feeds: feeds, selectedFeed: selectedFeed)
    }
}
