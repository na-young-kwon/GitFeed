//
//  CommitHistoryViewModel.swift
//  Pods
//
//  Created by 권나영 on 2023/02/23.
//

import Foundation
import Domain

final class CommitHistoryViewModel {
    let commitTitle: String
    let time: Date
    let description: String
    let avatarURL: URL
    let userName: String
    
    init(commitTitle: String,
         time: Date,
         description: String,
         avatarURL: URL,
         userName: String
    ) {
        self.commitTitle = commitTitle
        self.time = time
        self.description = description
        self.avatarURL = avatarURL
        self.userName = userName
    }
}
