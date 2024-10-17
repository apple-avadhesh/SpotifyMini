//
//  AuthHelper.swift
//  SpotifyMini
//
//  Created by Avadhesh Sharma on 16/10/24.
//

import Foundation

//MARK: Protocol
protocol APIAuthentication {
  func getAuthURL(clientID: String, scope: String, redirectURI: String) -> String
  func getAccessKey(code: String, redirectURI: String, clientID: String, clientSecret: String, completionHandler: @escaping (AuthModel) -> Void)
}

protocol NetworkRequest {
    func performRequest<T: Decodable>(with url: URL, httpMethod: String, httpBody: Data?, completionHandler: @escaping (Result<T, Error>) -> Void)
}

class AuthManager: APIAuthentication, ObservableObject {

  private var baseURL = "https://accounts.spotify.com/"
  private var path = "authorize"
  private let networkRequest: NetworkRequest

  init(networkRequest: NetworkRequest = URLSessionNetworkRequest()) {
    self.networkRequest = networkRequest
  }

  func getAuthURL(clientID: String,
                  scope: String,
                  redirectURI: String) -> String {
    var url = baseURL
    url += "\(path)?"
    url += "client_id=\(clientID)"
    url += "&redirect_uri=\(redirectURI)"
    url += "&scope=\(scope)"
    url += "&response_type=code"
    return url
  }

  func getAccessKey(code: String, redirectURI: String, clientID: String, clientSecret: String, completionHandler: @escaping (AuthModel) -> Void) {
      let baseUrl = "https://accounts.spotify.com/api/token"


      guard let url = URL(string: baseUrl) else {
          fatalError("Invalid URL") // Handle URL creation error appropriately
      }

      var components = URLComponents()
      components.queryItems = [
          URLQueryItem(name: "grant_type", value: "authorization_code"),
          URLQueryItem(name: "code", value: code),
          URLQueryItem(name: "redirect_uri", value:
redirectURI),
          URLQueryItem(name: "client_id", value: clientID),
          URLQueryItem(name: "client_secret", value: clientSecret),
      ]

      guard let query = components.query, let httpBody = query.data(using: .utf8) else {
          fatalError("Error creating HTTP body") // Handle body creation error
      }

    networkRequest.performRequest(with: url, httpMethod: "POST", httpBody: httpBody) { (result: Result<AuthModel, Error>) in
          switch result {
          case .success(let authKey):
              completionHandler(authKey)
          case .failure(let error):
              // Handle the error appropriately, e.g., print an error message or retry the request
              print("Error getting access key: \(error)")
          }
      }
  }
}

// MARK: - URLSession Network Request
struct URLSessionNetworkRequest: NetworkRequest {
  func performRequest<T: Decodable>(with url: URL, httpMethod: String, httpBody: Data?, completionHandler: @escaping (Result<T, Error>) -> Void) {
    var request = URLRequest(url: url)
    request.httpMethod = httpMethod
    request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    request.httpBody = httpBody

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      if let error = error {
        completionHandler(.failure(error))
        return
      }

      guard let data = data else {
        completionHandler(.failure(NSError(domain:"No data received", code: -1, userInfo: nil)))
        return
      }

      do {
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        completionHandler(.success(decodedData))
      } catch
      {
        completionHandler(.failure(error))
      }
    }
    task.resume()
  }
}

