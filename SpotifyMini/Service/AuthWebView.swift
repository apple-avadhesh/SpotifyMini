//
//  AuthWebView.swift
//  SpotifyMini
//
//  Created by Avadhesh Sharma on 16/10/24.
//

import SwiftUI
@preconcurrency import WebKit

// MARK: - AuthWebView

struct AuthWebView: UIViewRepresentable {

  var authViewModel: AuthViewModel

  let url: URL

  func makeUIView(context: Context) -> WKWebView {
    let webView = WKWebView()
    webView.navigationDelegate = context.coordinator
    return webView
  }

  func updateUIView(_ uiView: WKWebView, context: Context) {
    uiView.load(URLRequest(url: url))
  }

  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }

  // MARK: - Coordinator

  class Coordinator: NSObject, WKNavigationDelegate {
    let parent: AuthWebView
    let basicInfoProvider = PlistBasicInfoProvider(plistName: "SpotifyAuthInfo")

    init(_ parent: AuthWebView) {
      self.parent = parent
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
      guard let url = navigationAction.request.url,
            url.absoluteString.starts(with: basicInfoProvider.getRedirectURI())
      else {
        decisionHandler(.allow)
        return
      }

      // Extract the authorization code from the redirect URL
      if let code = url.query?.components(separatedBy: "code=").last {
        // Exchange the code for an access token
        parent.authViewModel.getAccessKey(code: code,
                                      redirectURI: basicInfoProvider.getRedirectURI(),
                                      clientID: basicInfoProvider.getClientID(),
                                      clientSecret: basicInfoProvider.getClientSecret())
      }

      decisionHandler(.cancel) // Stop loading the redirect URI
    }
  }
}
