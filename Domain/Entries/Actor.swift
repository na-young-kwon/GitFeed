//
//  Actor.swift
//  Domain
//
//  Created by 권나영 on 2023/02/18.
//

import Foundation

struct Actor: Codable {
  let name: String
  let avatar: URL

  enum CodingKeys: String, CodingKey {
    case name = "display_login"
    case avatar = "avatar_url"
  }
}
