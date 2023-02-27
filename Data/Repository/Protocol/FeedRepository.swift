//
//  FeedRepository.swift
//  Domain
//
//  Created by 권나영 on 2023/02/24.
//

import Foundation
import RxSwift

protocol FeedRepository {
    func repositories() -> Observable<[Repository]>
    func commits(for fullName: String) -> Observable<[Commit]>
}
