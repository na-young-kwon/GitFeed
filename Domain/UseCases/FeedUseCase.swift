//
//  FeedUseCase.swift
//  Domain
//
//  Created by κΆλμ on 2023/02/18.
//

import Foundation
import RxSwift

public protocol FeedUseCase {
    func repositories() -> Observable<[Repository]>
}
