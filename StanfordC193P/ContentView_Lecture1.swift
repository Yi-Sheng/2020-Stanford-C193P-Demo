//
//  ContentView.swift
//  StanfordC193P
//
//  Created by Eason Hsu on 2020/5/29.
//  Copyright © 2020 Eason Hsu. All rights reserved.
//

// 導入 SwiftUI 也會導入 Foundation
import SwiftUI

// 屬於 Functional Programming

struct ContentView_Lecture1: View {
    
    // body 就像是樂高的集合，裡面有很多 View 就像一個一個積木一樣。
    // body 不存在於記憶體當中，屬於 Computing Properties，當有存取到這個值時就會執行大括弧內的內容。
    // body 內省略掉了 return 關鍵字。
    // body 內要確定回傳的都是 View 的物件。
    var body: some View {
        
        
        // Step 1:
        
//        return ZStack(content: {
//            RoundedRectangle(cornerRadius: 10.0)
//            Text("👻")
//        })
        
        // Step 2:
        
//        return ZStack(content: {
//
//            RoundedRectangle(cornerRadius: 10.0)
//                // 任何圖形都可以使用 stroke 會在圖形邊框加上線條
//                .stroke()
//                // 將邊框的線條改為橘色
//                .foregroundColor(.orange)
//            Text("👻")
//        })
        
        // Step 3:
        
//        return ZStack(content: {
//
//            RoundedRectangle(cornerRadius: 10.0)
//                .stroke()
//            Text("👻")
//        }).foregroundColor(.orange) // 將 ZStack 內所有的 View 前景色設為橘色
        
        // Step 4:
        
//        return ZStack(content: {
//
//            RoundedRectangle(cornerRadius: 10.0)
//                .stroke()
//            Text("👻")
//        })
//            // 因為 ZStack 是不會顯示的，所以改變顏色對他不影響，但是增加 padding (填充)會讓 ZStack 周圍增加一點空間
//            .padding()
//            .foregroundColor(.orange)
        
        // Step 5:
        
//        return ZStack(content: {
//            RoundedRectangle(cornerRadius: 10.0)
//                .fill(Color.white)
//            RoundedRectangle(cornerRadius: 10.0)
//                .stroke(lineWidth: 3) // 增加邊框的寬度
//            Text("👻")
//        })
//            .padding()
//            .foregroundColor(.orange)
        
        // Step 6:
        
//        return ZStack(content: {
//            RoundedRectangle(cornerRadius: 10.0)
//                .fill(Color.white)
//            RoundedRectangle(cornerRadius: 10.0)
//                .stroke(lineWidth: 3)
//            Text("👻").font(.largeTitle)
//        })
//            .padding()
//            .foregroundColor(.orange)
//            .font(.largeTitle) // 會使 ZStack 內的所有文字使用大標題
        
        // Step 7:
        
        // 每一次執行 ForEach，index 都會隨著次數改變
        // 只有這樣做 ForEach 會繪製出 4 個一模一樣的模擬器
//        return ForEach(0..<4, content: { index in
//
//            ZStack(content: {
//                RoundedRectangle(cornerRadius: 10.0)
//                    .fill(Color.white)
//                RoundedRectangle(cornerRadius: 10.0)
//                    .stroke(lineWidth: 3)
//                Text("👻").font(.largeTitle)
//            })
//        })
//            .padding()
//            .foregroundColor(.orange)
//            .font(.largeTitle)
        
        // Step 8:
        
        // 利用 HStack 讓 4 個卡片顯示在同一頁面上，並讓程式碼看起來更簡潔
//        HStack {
//            ForEach(0..<4, content: { index in
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 10.0)
//                            .fill(Color.white)
//                        RoundedRectangle(cornerRadius: 10.0)
//                            .stroke(lineWidth: 3)
//                        Text("👻").font(.largeTitle)
//                    }
//                })
//            }
//                .padding()
//                .foregroundColor(.orange)
//                .font(.largeTitle)
        
        
        // Step 9:
        
        // 將 ZStack 內的元件搬移到外部去
//        HStack {
//            ForEach(0..<4, content: { index in
//                CardView()
//                })
//            }
//                .padding()
//                .foregroundColor(.orange)
//                .font(.largeTitle)
        
        
        // Step 10:
        
        // 修改 CardView 的內容，建立一個變數能夠判斷卡牌要正面朝上還是背面朝上
        HStack {
        ForEach(0..<4, content: { index in
            CardView_Lecture1(isFaceUp: true)
            })
        }
            .padding()
            .foregroundColor(.orange)
            .font(.largeTitle)
        }
}

struct ContentView_Lecture1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_Lecture1()
    }
}

struct CardView_Lecture1: View {
    
    var isFaceUp: Bool
    var body: some View {
        ZStack {
            
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 3)
                Text("👻").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 10.0)
                .fill()
            }
            
        }
    }
}
