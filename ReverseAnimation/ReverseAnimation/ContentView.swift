//
//  ContentView.swift
//  ReverseAnimation
//
//  Created by Nelson, Gunnar on 12/1/22.
//

import SwiftUI

struct ContentView: View {
  @State var isAnimated: Bool = false;
  var body: some View {
      VStack {
        Rectangle()
          OnAppear(perform: {
            withAnimation {
                isAnimated = true

                withAnimation(.default.delay(0.4)) { // play with delay to see what feels right
                    isAnimated = false
                }
            }
              }) {
                  Text("Text")
                      .foregroundColor(Color(red: 0.998, green: 0.369, blue: 0.369))
                  .font(.system(size: 33))
              }
              .frame(width: 100, height: 100)
              .background(Color(.blue))
              .offset(y: isAnimated ? 100 : 0)
      }
      .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
