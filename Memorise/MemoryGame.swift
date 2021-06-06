//
//  MemoryGame.swift
//  Memorise
//
//  Created by Nathan Eastwood on 05/06/2021.
//

import Foundation
// This is our "model" which is UI independent
// The model contains all of the data and the logic

struct MemoryGame<CardContent> where CardContent: Equatable { // Equatable means we can do == on CardContents
    var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    // this next function is the game logic
    // mutating function because it is going to change the Model
    mutating func choose(_ card: Card) { // can't use && when using if let, instead we use a comma
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content { // if true, we have a match
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices { // cards.indices is the same as 0..<cards.count for an Array
                    cards[index].isFaceUp = false // turns all cards face down
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
        print("\(cards)")
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
