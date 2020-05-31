//
//  ContentView.swift
//  StanfordC193P
//
//  Created by Yi-Sheng Hsu on 2020/5/31.
//  Copyright © 2020 Eason Hsu. All rights reserved.
//

import SwiftUI

struct ContentView_Lecture2: View {
    var body: some View {
        HStack {
        ForEach(0..<4, content: { index in
            CardView_Lecture2(isFaceUp: true)
            })
        }
            .padding()
            .foregroundColor(.orange)
            .font(.largeTitle)
    }
}

struct ContentView_Lecture2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_Lecture2()
    }
}

struct CardView_Lecture2: View {
    
    var isFaceUp: Bool
    var body: some View {
        ZStack {
            
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 3)
                Text("🧘").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 10.0)
                .fill()
            }
            
        }
    }
}
