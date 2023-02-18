//
//  UseCaseProvider.swift
//  NetworkPlatform
//
//  Created by 권나영 on 2023/02/18.
//

import Foundation
import Domain

// Domain에있는 UseCaseProvider 프로토콜 채택
public final class UseCaseProvider: Domain.UseCaseProvider {
    private let networkProvider: NetworkProvider
    
    public init() {
        networkProvider = NetworkProvider()
    }
    
    public func makeFeedsUseCase() -> Domain.FeedUseCase {
        return
    }
}
