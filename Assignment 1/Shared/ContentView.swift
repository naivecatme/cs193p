//
//  ContentView.swift
//  Shared
//
//  Created by naivecat on 2021/11/4.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["✈️", "⛴", "🚲", "🚁", "🚗", "🚜", "🚑", "🏍", "🚝", "🚄", "🚀", "⛵️", "🛶", "🛳", "🛩", "🛸", "🏎", "🦽", "🚠","🚒","🚍","🚘","🚖","🚔"]
    @State var emojiCount = 10
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self, content: { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    })
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack() {
                theme1
                Spacer()
                theme2
                Spacer()
                theme3
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
        
    }
    
    let emojis1 = ["✈️", "⛴", "🚲", "🚁", "🚗", "🚜", "🚑", "🏍", "🚝", "🚄", "🚀", "⛵️", "🛶", "🛳", "🛩", "🛸", "🏎", "🦽", "🚠","🚒","🚍","🚘","🚖","🚔"]
    
    var theme1: some View {
        Button(action:{
            emojis = emojis1.shuffled()
            emojiCount = emojis1.count
        },label:{
            VStack {
                Image(systemName: "car")
                    .font(.largeTitle)
                Text("Theme 1")
            }
        })
    }
    
    let emojis2 = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐽", "🐸", "🐵", "🙈", "🙉","🙊","🐒","🐔","🐧"]
    
    var theme2: some View {
        Button(action:{
            emojis = emojis2.shuffled()
            emojiCount = emojis2.count
        },label:{
            VStack {
                Image(systemName: "questionmark.circle")
                    .font(.largeTitle)
                Text("Theme 2")
            }
        })
    }
    
    var emojis3 = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍈", "🍒", "🍑", "🥭", "🍍", "🥥", "🥝", "🍅", "🍆","🥑","🥦","🥬"]
    
    var theme3: some View {
        Button(action:{
            emojis = emojis3.shuffled()
            emojiCount = emojis3.count
        },label:{
            VStack {
                Image(systemName: "questionmark.circle")
                    .font(.largeTitle)
                Text("Theme 3")
            }
        })
    }
}


struct CardView: View {
    var content : String
    @State var isFaceUp : Bool = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill().foregroundColor(.red)
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.light)
        ContentView().preferredColorScheme(.dark)
    }
}
