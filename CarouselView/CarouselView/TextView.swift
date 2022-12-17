//
//  TextView.swift
//  CarouselView
//
//  Created by Nelson, Gunnar on 11/8/22.
//


import Foundation
import SwiftUI

let numberText = ["Bin contents image", "Product image", "Label image"]



struct TextNew: View {
  
  //private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
  @State private var index = 0
  @State private var selectedNum: String = ""

  
  var body: some View {
    
    GeometryReader { proxy in
      
      TabView(selection: $selectedNum) {
        
        ForEach(numberText, id: \.self) { num in
          Text("\(num)")
            .font(.system(size: 10))
            .foregroundColor(.blue)
            .padding(.bottom, 50)
        }
      }
      .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
  }
}
/*
 .onReceive(timer, perform: { _ in
 withAnimation {
 index = index < numberText.count ? index + 1 : 1
 selectedNum = numberText[index - 1]
 }
 })
 
 }
 }
 }
 */
