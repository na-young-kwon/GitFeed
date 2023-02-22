//
//  Owner.swift
//  Domain
//
//  Created by 권나영 on 2023/02/22.
//

import Foundation

public struct Owner: Decodable {
    public let name: String
    public let avatar: URL
    
    private enum CodingKeys: String, CodingKey {
        case name = "login"
        case avatar = "avatar_url"
    }
}
