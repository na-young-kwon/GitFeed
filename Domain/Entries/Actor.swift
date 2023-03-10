//
//  Actor.swift
//  Domain
//
//  Created by κΆλμ on 2023/02/18.
//

import Foundation

public struct Actor: Codable {
    public let name: String
    public let avatar: URL
    
    private enum CodingKeys: String, CodingKey {
        case name = "display_login"
        case avatar = "avatar_url"
    }
}
