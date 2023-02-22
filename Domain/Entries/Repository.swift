//
//  Repository.swift
//  Domain
//
//  Created by 권나영 on 2023/02/22.
//

import Foundation

public struct Repository: Decodable {
    public let id: Int
    public let name: String
    public let owner: Owner
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case owner
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
