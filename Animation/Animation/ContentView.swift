//
//  ContentView.swift
//  Animation
//
//  Created by Nelson, Gunnar on 11/17/22.
//

import SwiftUI

struct ContentView: View {
  @State private var animationAmount = 1.0

  var body: some View {
      Button() {
          animationAmount += 1
      } label: {
        SwiftUI.Image("grainger-logo")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 250, height: 230)
          .clipped()
      }
      .padding(50)
      .background(.red)
      .foregroundColor(.white)
      .clipShape(Circle())
      .scaleEffect(animationAmount)
      .animation(.easeInOut(duration: 2), value: animationAmount)
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
