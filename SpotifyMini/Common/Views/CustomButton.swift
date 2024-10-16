//
//  RoundedButton.swift
//  SpotifyMini
//
//  Created by Avadhesh Sharma on 15/10/24.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var backgroundColor: Color = Color.green // default green
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(backgroundColor)
                .cornerRadius(30)
                .frame(height: 50)
        }
        .padding(.horizontal, 30)
    }
}
