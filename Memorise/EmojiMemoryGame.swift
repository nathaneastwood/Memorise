//
//  EmojiMemoryGame.swift
//  Memorise
//
//  Created by Nathan Eastwood on 05/06/2021.
//

import SwiftUI

class EmojiMemoryGame {
    // statics are created once in the entire app whereas vars are created in every instance of the class
    static let emojis = ["🚗", "🚌", "🚛", "🚓", "🛵", "✈️", "🚒", "🚀", "🚁", "🛸", "🚑", "🦼", "🛺", "🏍", "🚲", "🛻", "🚠", "🚂", "🚝", "🚜", "🏎", "⛵️", "🚤", "🛳"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    // private(set) says other classes and structs can look at the model, but can't choose it
    private(set) var model: MemoryGame<String> = createMemoryGame()
        
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }

    // if we had another var or func calling the statics, we would need the full name, e.g. EmojiMemoryGame.emojis
}
