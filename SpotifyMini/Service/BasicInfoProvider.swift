//
//  BasicInfoProvider.swift
//  SpotifyMini
//
//  Created by Avadhesh Sharma on 16/10/24.
//

import Foundation

protocol BasicInfoProvider {
  func getClientID() -> String
  func getClientSecret() -> String
  func getRedirectURI() -> String
}

struct PlistBasicInfoProvider: BasicInfoProvider {

  private let plistData: NSDictionary

  init(plistName: String) {
    guard let filePath = Bundle.main.path(forResource: plistName, ofType: "plist"),
          let plistData = NSDictionary(contentsOfFile: filePath) else {
      fatalError("Couldn't find or read the plist file!")
    }
    self.plistData = plistData
  }

  func getClientID() -> String {
    guard let clientID = plistData["ClientID"] as? String else {
      fatalError("ClientID not found in the plist or invalid format.")
    }
    return clientID
  }

  func getClientSecret() -> String {
    guard let clientSecret = plistData["ClientSecret"] as? String else {
      fatalError("ClientSecret not found in the plist or invalid format.")
    }
    return clientSecret
  }

  func getRedirectURI() -> String {
    guard let clientSecret = plistData["redirectURI"] as? String else {
      fatalError("RedirectURI not found in the plist or invalid format.")
    }
    return clientSecret
  }
}
