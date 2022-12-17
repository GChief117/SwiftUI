//
//  CarousleView.swift
//  UITestHere
//
//  Created by Maddali, Ramesh on 11/11/22.
//

import SwiftUI


struct CarouselItem {
    let itemDetails: Text
    let itemImageName: String
}

struct CarousleView: View {
    var carouselItems: [String] = [ "One","Two","Three"]
    var carousleImages: [String] = ["grid_1", "grid_2", "grid_3"]
    
    var body: some View {
        HStack(alignment: .center, spacing: 30) {
          ForEach(0..<carousleImages.count) { i in
            VStack {
              Text(carouselItems[i])
                .frame(width:250, height: 30, alignment: .center)
              Image(carousleImages[i])
                .resizable()
                .scaledToFill()
                .frame(width: 250, height: 280, alignment: .center)
                .background(.green)
                .cornerRadius(10)
              
            }
          }
        }.modifier(ScrollingHStackModifier(items: carousleImages.count, itemWidth: 250, itemSpacing: 30))
        Spacer()
    }
}

struct CarousleView_Previews: PreviewProvider {
    static var previews: some View {
        CarousleView()
    }
}
