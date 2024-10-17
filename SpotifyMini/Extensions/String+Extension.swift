//
//  String+Extension.swift
//  SpotifyMini
//
//  Created by Avadhesh Sharma on 17/10/24.
//

import Foundation

extension String {
  // MARK: Greeting Text
  static func greeting() -> String {
    let hour = Calendar.current.component(.hour, from: Date())
    switch hour {
    case 6..<12: return "Good Morning"
    case 12..<17: return "Good Afternoon"

    case 17..<22: return "Good Evening"
    default: return "Good Night"

    }
  }

  // MARK: Scopes
  static func from(authScopes: [AuthScope]) -> String {
      authScopes.map { $0.rawValue }.joined(separator: "+")
  }
}


