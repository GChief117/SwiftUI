//
//  ContentView.swift
//  CorrectedCarousel
//
//  Created by Nelson, Gunnar on 11/13/22.
//

import SwiftUI

struct ContentView: View {
    
  @StateObject var carouselState = CarouselStateModel()
  
  var body: some View {
    Text("text")
      SnapCarousel()
        .environmentObject(carouselState)
  }
}
  
  struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
  }
}
