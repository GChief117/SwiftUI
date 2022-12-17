//
//  ContentView.swift
//  SwiftUICarousel
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
  @StateObject var carouselState = CarouselStateModel()
  
  var body: some View {
      SnapCarousel()
        .environmentObject(carouselState)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
