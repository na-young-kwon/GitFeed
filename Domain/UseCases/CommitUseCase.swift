//
//  CommitUseCase.swift
//  Domain
//
//  Created by κΆλμ on 2023/02/23.
//

import Foundation
import RxSwift

public protocol CommitUseCase {
    func commits(for: String) -> Observable<[Commit]>
}
