//
//  EmojiMemoryGame.swift
//  Memorise
//
//  Created by Nathan Eastwood on 05/06/2021.
//

import SwiftUI

// This is our ViewModel
// This binds the View to the Model
// It makes the Model private and only exposes the required information to the View

class EmojiMemoryGame: ObservableObject {
    // statics are created once in the entire app whereas vars are created in every instance of the class
    // if we had another var or func calling the statics, we would need the full name, e.g. EmojiMemoryGame.emojis
    static let emojis = ["🚗", "🚌", "🚛", "🚓", "🛵", "✈️", "🚒", "🚀", "🚁", "🛸", "🚑", "🦼", "🛺", "🏍", "🚲", "🛻", "🚠", "🚂", "🚝", "🚜", "🏎", "⛵️", "🚤", "🛳"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
        
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }

    // MARK - Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
