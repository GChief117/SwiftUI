//
//  Cards.swift
//  SwiftUICarousel
//
//  Created by Nelson, Gunnar on 11/11/22.
//

import Foundation
import SwiftUI

let items = [
  Card(id: 0, name: "Hey", labels: "Bin Content image"),
  Card(id: 1, name: "Ho", labels: "Product image"),
  Card(id: 2, name: "Lets", labels: "Label image"),
]

struct Labeling<Items : View> : View {
  @EnvironmentObject var carouselState: CarouselStateModel
  
  var body: some View {
    
    let intForIndex = carouselState.activeCard
    let index = items.index(items.startIndex, offsetBy: intForIndex)
    let firstPart = items[index]
  }
  
}


