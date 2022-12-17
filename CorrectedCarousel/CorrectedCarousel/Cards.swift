//
//  Cards.swift
//  SwiftUICarousel
//
//  Created by Nelson, Gunnar on 11/11/22.
//

import Foundation
import SwiftUI




struct Labeling<Items : View> : View {
  @EnvironmentObject var carouselState: CarouselStateModel
  
  var body: some View {
    
    let intForIndex = carouselState.activeCard
    let index = items.index(items.startIndex, offsetBy: intForIndex)
    let firstPart = items[index]
  }
  
}


