//
//  ContentView.swift
//  Carousellist
//
//  Created by Nelson, Gunnar on 11/11/22.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    HStack {
      List(1..<51) {
        Text("\($0)")
      }
      .listStyle(.sidebar)
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
