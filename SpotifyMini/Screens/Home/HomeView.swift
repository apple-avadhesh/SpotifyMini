//
//  HomeView.swift
//  SpotifyMini
//
//  Created by Avadhesh Sharma on 17/10/24.
//

import SwiftUI


struct HomeScreen: View {
  var body: some View {
    NavigationView { // Add NavigationView here
      ScrollView { // Wrap the entire content in a ScrollView
        VStack(spacing: 0) {
          // Top Bar
          HStack {
            Text(String.greeting())
              .font(.largeTitle)
              .fontWeight(.bold)
            Spacer()
            Image(systemName: "gearshape")
              .font(.title2)
          }
          .padding()

          // Define grid layout
          let columns: [GridItem] = [
            GridItem(.flexible(), spacing: 8),
            GridItem(.flexible(), spacing: 8)
          ]

          // Grid of items
          LazyVGrid(columns: columns, spacing: 8) {
            ForEach(0..<8) { index in
              HStack {
                // Image on the left
                Image(systemName: "music.note")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width: 50, height: 50)
                  .background(Color.gray.opacity(0.2))
                  .clipShape(RoundedCornersShape(corners: [.topLeft, .bottomLeft], radius: 5)) // Custom corner radius

                // Text on the right
                Text("Music or Podcast \(index + 1)")
                  .font(.subheadline)
                  .foregroundColor(.primary)
                  .padding(.leading, 0)

                Spacer()
              }
              .padding(0)
              .background(Color.gray.opacity(0.1))
              .cornerRadius(5)
            }
          }
          .padding(.horizontal)
        }
      }
    }
  }
}
