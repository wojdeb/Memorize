//
//  ContentView.swift
//  Memorize
//
//  Created by mac on 29/06/2025.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["🥦", "🌈", "⭐️", "🌎", "☀️", "💧", "🍎", "🍕", "⚽️", "🧩"]
    @State var cardCount: Int = 4
    
    var body: some View {
        
        VStack {
            ScrollView {
                cards
            }
            cardCountAdjusters
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))] ) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
    
    var cardCountAdjusters: some View {
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String, label: String) -> some View {
        Button(action: {
            cardCount += offset
        },
               label: {
            HStack {
                Image(systemName: symbol)
                Text(label)
            }
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "minus.circle", label: "Remove card")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "plus.circle", label: "Add card")
    }
}

struct CardView: View {
    @State private var isFaceUp = false
    let content: String
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
            }.opacity(isFaceUp ? 1 : 0)
            
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
