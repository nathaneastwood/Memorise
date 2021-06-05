//
//  ContentView.swift
//  Memorise
//
//  Created by Nathan Eastwood on 01/06/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var emojis = ["🚗", "🚌", "🚛", "🚓", "🛵", "✈️", "🚒", "🚀", "🚁", "🛸", "🚑", "🦼", "🛺", "🏍", "🚲", "🛻", "🚠", "🚂", "🚝", "🚜", "🏎", "⛵️", "🚤", "🛳"]
//    @State private var emojiCount = emojis.count
    
    var body: some View {
        VStack {
            Text("Memorise!")
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis.shuffled()[0..<emojis.count], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                vehicles
                    .padding(.horizontal)
                devices
                    .padding(.horizontal)
                animals
                    .padding(.horizontal)
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var vehicles: some View {
        VStack {
            Button {
                emojis = ["🚗", "🚌", "🚛", "🚓", "🛵", "✈️", "🚒", "🚀", "🚁", "🛸", "🚑", "🦼", "🛺", "🏍", "🚲", "🛻", "🚠", "🚂", "🚝", "🚜", "🏎", "⛵️", "🚤", "🛳"]
            } label: {
                Image(systemName: "car.circle")
            }
            Text("Vehicles")
                .font(.footnote)
        }
    }
    
    var devices: some View {
        VStack {
            Button {
                emojis = ["⌚️", "📱", "💻", "🖥", "🖨", "🖱", "🕹", "📷", "🎥", "⌨️", "🎧"]
            } label: {
                Image(systemName: "headphones.circle")
            }
            Text("Devices")
                .font(.footnote)
        }
    }
    
    var animals: some View {
        VStack {
            Button {
                emojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵"]
            } label: {
                Image(systemName: "ant.circle")
            }
            Text("Animals")
                .font(.footnote)
        }
    }
    
//    var remove: some View {
//        Button {
//            if emojiCount > 1 {
//                emojiCount -= 1
//            }
//        } label: {
//            Image(systemName: "minus.circle")
//        }
//    }
//
//    var add: some View {
//        Button {
//            if emojiCount < emojis.count {
//                emojiCount += 1
//            }
//        } label: {
//            Image(systemName: "plus.circle")
//        }
//    }
}

struct CardView: View {
    var content: String
    @State private var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
    }
}
