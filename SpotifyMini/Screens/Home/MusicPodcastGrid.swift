//
//  Untitled.swift
//  SpotifyMini
//
//  Created by Avadhesh Sharma on 17/10/24.
//

import SwiftUI

// Custom shape to round specific corners
struct RoundedCornersShape: Shape {
    var corners: UIRectCorner
    var radius: CGFloat

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

// New grid view for music or podcast items
struct MusicPodcastGrid: View {
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8)
    ]

  var body: some View {
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
