//
//  CommitItemViewModel.swift
//  Pods
//
//  Created by 권나영 on 2023/02/23.
//

import Foundation
import Domain

final class CommitItemViewModel {
    let commitMessage: String
    let userName: String
    let time: String
    let profileURL: URL
    
    init(with commit: Commit) {
        self.commitMessage = commit.comment.message
        self.userName = commit.author.name
        self.time = commit.comment.date.date
        self.profileURL = commit.author.avatar
    }
}
