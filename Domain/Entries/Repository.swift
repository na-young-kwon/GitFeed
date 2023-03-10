//
//  Repository.swift
//  Domain
//
//  Created by κΆλμ on 2023/02/22.
//

import Foundation

public struct Repository: Decodable {
    public let id: Int
    public let fullName: String
    public let name: String
    public let description: String?
    public let stars: Int
    public let forks: Int
    public let language: String?
    public let owner: Owner
    
    private enum CodingKeys: String, CodingKey {
        case id, name, owner, description, language
        case fullName = "full_name"
        case forks = "forks_count"
        case stars = "stargazers_count"
    }
}

public struct Owner: Decodable {
    public let name: String
    public let avatar: URL
    
    private enum CodingKeys: String, CodingKey {
        case name = "login"
        case avatar = "avatar_url"
    }
}
