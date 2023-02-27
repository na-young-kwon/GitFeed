//
//  Feed.swift
//  Domain
//
//  Created by 권나영 on 2023/02/18.
//

import Foundation

public struct Feed: Decodable {
    public let id: String
    public let action: String
    public let repo: Repo
    public let actor: Actor
    
    private enum CodingKeys: String, CodingKey {
        case id
        case action = "type"
        case repo
        case actor
    }
}
