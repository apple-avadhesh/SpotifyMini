//
//  LoginView.swift
//  SpotifyMini
//
//  Created by Avadhesh Sharma on 15/10/24.
//

import SwiftUI


struct LoginScreen: View {

  let basicInfoProvider = PlistBasicInfoProvider(plistName: "SpotifyAuthInfo")
  @ObservedObject var authViewModel = AuthViewModel()

  var body: some View {
    GeometryReader { geometry in
      NavigationView {
        VStack {
          Spacer()
          Image(systemName: "music.note.list")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
            .frame(width: geometry.size.width / 3)
            .foregroundStyle(.white)

          Text("Millions of songs.\n Free on Spotify.")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding()
            .multilineTextAlignment(.center)

          NavigationLink(
            destination:
              AuthWebView(authViewModel: authViewModel, url: authViewModel.getAuthURL(clientID: basicInfoProvider.getClientID(), scope: String.from(authScopes: [.userReadRecentlyPlayed, .userTopRead, .userReadPlayBackPosition,
                                                                                                                                               .userLibraryRead, .userLibraryModify, .userFollowRead, .userFollowModify,
                                                                                                                                               .playlistModifyPublic, .playlistModifyPrivate, .playlistReadPrivate]), redirectURI: basicInfoProvider.getRedirectURI())!)
              .ignoresSafeArea()
              .navigationTitle("Log in")
              .navigationBarTitleDisplayMode(.inline)
          ) {
            CustomTextButton(title: "Log in")
          }
          Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.black)
      }
    }
  }
}
