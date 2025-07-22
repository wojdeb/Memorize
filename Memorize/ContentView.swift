//
//  ContentView.swift
//  Memorize
//
//  Created by mac on 29/06/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true, emoji: "🥦")
            CardView(emoji: "🌈")
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    var emoji: String
    
    var body: some View {
        ZStack(content: {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text(emoji)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        }
        )}
}

#Preview {
    ContentView()
}
