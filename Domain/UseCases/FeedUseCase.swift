//
//  FeedUseCase.swift
//  Domain
//
//  Created by 권나영 on 2023/02/18.
//

import Foundation
import RxSwift

public protocol FeedUseCase {
    func feeds(for: [Feed]) -> Observable<[Feed]>
}
