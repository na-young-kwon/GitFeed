//
//  UseCaseProvider.swift
//  Domain
//
//  Created by κΆλμ on 2023/02/18.
//

import Foundation

public protocol UseCaseProvider {
    func makeFeedsUseCase() -> FeedUseCase
    func makeCommitUseCase() -> CommitUseCase
}
