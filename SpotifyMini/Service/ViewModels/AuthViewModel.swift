//
//  AuthViewModel.swift
//  SpotifyMini
//
//  Created by Avadhesh Sharma on 16/10/24.
//

import SwiftUI
import Combine

class AuthViewModel: ObservableObject {
    @Published var authModel: AuthModel?
    @Published var isLoading = false
    @Published var isAuthenticated = false // Add this property

    private let apiAuthentication: APIAuthentication
    private var cancellables = Set<AnyCancellable>()

    init(apiAuthentication: APIAuthentication = AuthManager()) {
        self.apiAuthentication = apiAuthentication

        // Observe changes in authModel
        $authModel
            .receive(on: DispatchQueue.main)
            .map { $0 != nil } // Map authModel to a boolean value
            .assign(to: &$isAuthenticated) // Update isAuthenticated
    }

    func getAuthURL(clientID: String, scope: String, redirectURI: String) -> URL? {
        let urlString = apiAuthentication.getAuthURL(clientID: clientID, scope: scope, redirectURI: redirectURI)
        return URL(string: urlString)
    }

    func getAccessKey(code: String, redirectURI: String, clientID: String, clientSecret: String) {
        isLoading = true
        apiAuthentication.getAccessKey(code: code, redirectURI: redirectURI, clientID: clientID, clientSecret: clientSecret) { [weak self] authModel in
            DispatchQueue.main.async {
                self?.authModel = authModel
                self?.isLoading = false
            }
        }
    }
}
