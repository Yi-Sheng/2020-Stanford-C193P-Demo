//
//  MemoryGame.swift
//  StanfordC193P
//
//  Created by Yi-Sheng Hsu on 2020/6/1.
//  Copyright © 2020 Eason Hsu. All rights reserved.
//

import Foundation

// 這是 MVVM 裡頭的 Model

struct MemoryGame<CardContent> {
    
    // MARK: - Properties
    
    var cards: Array<Card>
    
    // MARK: - Initialization
    
    // 可以有多個 init
    // 初始化共有幾對卡片，並且製作出卡片
    init(numberOfPairsofCards: Int, cardContentFactory: (Int) -> CardContent) {
        
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsofCards {
            
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
    }
    
    // MARK: - Method
    
    func choose(card: Card) {
        
        print("Card chosen: \(card)")
    }
    
    // MARK: - Custom Struct
    
    // 服從 Identifiable 協定，讓每一張卡片都是能被識別的，也就是會有 ID。
    struct Card: Identifiable {
        var id: Int
        
        // MARK: - Properties
        
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
    }
}
