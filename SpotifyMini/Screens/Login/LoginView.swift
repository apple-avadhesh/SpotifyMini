//
//  LoginView.swift
//  SpotifyMini
//
//  Created by Avadhesh Sharma on 15/10/24.
//

import SwiftUI

struct LoginScreen: View {
  @ObservedObject var viewModel: LoginViewModel

  var body: some View {
    GeometryReader { geometry in
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

        CustomButton(title: "Sign up for free") {
          viewModel.signUp()
        }

        CustomButton(title: "Log in", backgroundColor: .clear) {

        }

        Spacer()
      }
      .frame(maxWidth: .infinity)
      .background(Color.black)
    }
  }
}
