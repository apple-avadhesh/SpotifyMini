//
//  AuthModel.swift
//  SpotifyMini
//
//  Created by Avadhesh Sharma on 16/10/24.
//

struct AuthModel: Decodable {
  let accessToken: String
  let scope: String
  let refreshToken: String?

  enum CodingKeys: String, CodingKey {
    case accessToken = "access_token"
    case refreshToken = "refresh_token"
    case scope
  }
}
