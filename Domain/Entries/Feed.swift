//
//  Feed.swift
//  Domain
//
//  Created by 권나영 on 2023/02/18.
//

import Foundation

public struct Feed: Decodable {
  let action: String
  let repo: Repo
  let actor: Actor

  private enum CodingKeys: String, CodingKey {
    case action = "type"
    case repo
    case actor
  }
}
