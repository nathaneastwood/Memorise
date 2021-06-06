//
//  MemoriseApp.swift
//  Memorise
//
//  Created by Nathan Eastwood on 01/06/2021.
//

import SwiftUI

@main
struct MemoriseApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
