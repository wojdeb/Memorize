//
//  ContentView.swift
//  Memorize
//
//  Created by mac on 29/06/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let emojis: Array<String> = ["🥦", "🌈", "⭐️"]
        HStack {
            ForEach(emoji.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        .padding()
    }
}

struct CardView: View {
    @State private var isFaceUp = false
    let content: String
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
