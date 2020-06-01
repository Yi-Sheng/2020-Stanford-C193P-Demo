//
//  EmojiMemoryGame.swift
//  StanfordC193P
//
//  Created by Yi-Sheng Hsu on 2020/6/1.
//  Copyright © 2020 Eason Hsu. All rights reserved.
//

import SwiftUI

// 這裡是 MVVM 的 ViewModel
// ViewModel 本質上是個 UI 的東西，因為它知道如何在螢幕上顯示。

class EmojiMemoryGame {
    
    
    // MARK: - Properties
    
    // Step 1:
    
    // 設為 private 是因為讓這個變數只能由 EmojiMemoryGame 去做值的更改，其餘的人無法碰觸到它。
    // 在 private 後面加上 set 表示把 ViewModel 這個門關上了，只能讓 EmojiMemoryGame 可以修改值，但是這個門是透明的玻璃門，外部的人還是可以看到 Model。
//    private(set) var model: MemoryGame<String>
    
    // Step 2:
    
//    // cardContentFactory 內使用 Closure 寫法
//    private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsofCards: 2, cardContentFactory: {(pairIndex: Int) -> String in
//
//        "👻"
//    })
    
    // Step 3:
    
    // 簡化 Cloture 內的寫法
//    private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsofCards: 2) { _ in "👻" }
    
    // Step 4:
    
//    private var model: MemoryGame<String> = createMemoryCard()
//
//    func createMemoryCard() -> MemoryGame<String> {
//
//        let emoji: Array<String> = ["👻", "🎃"]
//        return MemoryGame<String>(numberOfPairsofCards: 2) { pairIndex in
//
//            return emoji[pairIndex]
//        }
//    }
    
    // Step 5:
    
//    // createMemoryCard 是個 func 類別，而不是 EmojiMemoryGame 的實體。
//    private var model: MemoryGame<String> = createMemoryCard()
//
//    static func createMemoryCard() -> MemoryGame<String> {
//
//        let emoji: Array<String> = ["👻", "🎃"]
//        return MemoryGame<String>(numberOfPairsofCards: 2) { pairIndex in
//
//            return emoji[pairIndex]
//        }
//    }
    
    // Step 6:
    
    //
    private var model: MemoryGame<String> = createMemoryCard()
        
    static func createMemoryCard() -> MemoryGame<String> {
        
        let emoji = ["👻", "🎃", "🕷"]
        return MemoryGame<String>(numberOfPairsofCards: emoji.count) { pairIndex in
            
            return emoji[pairIndex]
        }
    }
    
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        
        // 可省略 return
        model.cards
    }
    
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        
        model.choose(card: card)
    }
}
