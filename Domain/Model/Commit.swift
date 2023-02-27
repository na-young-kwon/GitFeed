//
//  Commit.swift
//  Domain
//
//  Created by 권나영 on 2023/02/23.
//

import Foundation

public struct Commit: Decodable {
    public let comment: Comment
    public let author: Author
    
    private enum CodingKeys: String, CodingKey {
        case author
        case comment = "commit"
    }
}

public struct Comment: Decodable {
    public let message: String
    public let date: Author
    
    private enum CodingKeys: String, CodingKey {
        case message
        case date = "author"
    }
    
    public struct Author: Decodable {
        public let date: String
        
        private enum CodingKeys: String, CodingKey {
            case date = "date"
        }
    }
}

public struct Author: Decodable {
    public let name: String
    public let avatar: URL
    
    private enum CodingKeys: String, CodingKey {
        case name = "login"
        case avatar = "avatar_url"
    }
}
