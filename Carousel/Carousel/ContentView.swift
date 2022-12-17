//
//  ContentView.swift
//  Carousel
//
//  Created by Nelson, Gunnar on 11/11/22.
//

import SwiftUI


struct ContentView: View {
  
  //pciture with label
  var colors: [Color] = [.blue, .green, .red]
  //var array: [String] = ["Bin Content Image", "Product Image", "Label Image"]
  
  
  //var planet: Planet
  
  
  var body: some View {
    HStack(alignment: .center, spacing: 30) {
      ForEach(0..<colors.count) { i in
        
          //array[i]
          //picure
          colors[i]
            .frame(width: 260, height: 220)
            .cornerRadius(10)
        }.frame(alignment: .center)
      }.modifier(CarouselStateModel(items: colors.count, itemWidth: 250, itemSpacing: 40))
  }
    /*
     ScrollView {
     VStack (alignment: .leading) {
     ForEach(0..<planet.minerals.count) { i in
     HStack {
     Circle()
     .frame(width: 50, height: 50)
     .foregroundColor(.black)
     
     VStack (alignment: .leading) {
     Text(planet.minerals[i])
     .font(.system(size: 22, weight: .regular))
     .foregroundColor(.primary)
     Text(planet.colors[i])
     .font(.system(size: 22, weight: .regular))
     .foregroundColor(.secondary)
     }
     }
     
     }
     Spacer()
     }
     }
     */
    
    
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(planet: planetsData[0])
  }
}
