//
//  ContentView_Lecture2.swift
//  StanfordC193P
//
//  Created by Yi-Sheng Hsu on 2020/5/31.
//  Copyright © 2020 Eason Hsu. All rights reserved.
//

import SwiftUI

// Note:

// MVVM：Model-View-ViewModel
/*
 Model：不會導入 SwiftUI。用來處理資料以及邏輯運算。Model is "The truth"
 View：反映模型，資料會從 Model 再到 View 去呈現。View 是沒有狀態的。View 是 Declarative(聲明式的)。View 是被動的，只有 Model 改變時 View 才會變化
 ViewModel：作用是將 View 綁定到 Model 上。若 Model 發生改變，ViewModel 會發布訊息，而有訂閱接收訊息的 View 會根據發布的內容進行改變，改變的內容是透過 ViewModel 取得，並不會碰到 Model。會處理使用者的 Intent(意圖)，當 View 的按鈕改變時會呼叫 Intent Function。ViewModel 是一個 Class。
 
 */

// 這裡是 MVVM 的 View

// Step 1:

//struct ContentView_Lecture2: View {
//    var body: some View {
//
//        HStack {
//        ForEach(0..<4, content: { index in
//            CardView_Lecture2(isFaceUp: true)
//            })
//        }
//            .padding()
//            .foregroundColor(.orange)
//            .font(.largeTitle)
//    }
//}
//
//struct ContentView_Lecture2_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView_Lecture2()
//    }
//}
//
//struct CardView_Lecture2: View {
//
//    var isFaceUp: Bool
//    var body: some View {
//        ZStack {
//
//            if isFaceUp {
//                RoundedRectangle(cornerRadius: 10.0)
//                    .fill(Color.white)
//                RoundedRectangle(cornerRadius: 10.0)
//                    .stroke(lineWidth: 3)
//                Text("🧘").font(.largeTitle)
//            } else {
//                RoundedRectangle(cornerRadius: 10.0)
//                .fill()
//            }
//
//        }
//    }
//}

// Step 2:

//struct ContentView_Lecture2: View {
//
//    var viewModel: EmojiMemoryGame
//    var body: some View {
//
//        HStack {
//            ForEach(viewModel.cards, content: { card in
//                CardView_Lecture2(card: card)
//            })
//        }
//            .padding()
//            .foregroundColor(.orange)
//            .font(.largeTitle)
//    }
//}
//
//struct ContentView_Lecture2_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView_Lecture2(viewModel: EmojiMemoryGame())
//    }
//}
//
//struct CardView_Lecture2: View {
//
//    var card: MemoryGame<String>.Card
//    var body: some View {
//        ZStack {
//
//            if card.isFaceUp {
//                RoundedRectangle(cornerRadius: 10.0)
//                    .fill(Color.white)
//                RoundedRectangle(cornerRadius: 10.0)
//                    .stroke(lineWidth: 3)
//                Text(card.content)
//            } else {
//                RoundedRectangle(cornerRadius: 10.0)
//                .fill()
//            }
//
//        }
//    }
//}

// Step 3:

struct ContentView_Lecture2: View {
    
    var viewModel: EmojiMemoryGame
    var body: some View {
        
        HStack {
            ForEach(viewModel.cards) { card in
                CardView_Lecture2(card: card).onTapGesture {
                    
                    self.viewModel.choose(card: card)
                }
            }
        }
            .padding()
            .foregroundColor(.orange)
            .font(.largeTitle)
    }
}

struct ContentView_Lecture2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_Lecture2(viewModel: EmojiMemoryGame())
    }
}

struct CardView_Lecture2: View {
    
    var card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0)
                .fill()
            }
            
        }
    }
}
