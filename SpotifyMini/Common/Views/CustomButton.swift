//
//  RoundedButton.swift
//  SpotifyMini
//
//  Created by Avadhesh Sharma on 15/10/24.
//

import SwiftUI

struct CustomTextButton: View {
    var title: String
    var backgroundColor: Color = Color.green // default green

    var body: some View {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(backgroundColor)
                .cornerRadius(30)
                .frame(height: 50)
        .padding(.horizontal, 30)
    }
}
