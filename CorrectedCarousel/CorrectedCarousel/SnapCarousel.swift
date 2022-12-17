//
//  SnapCarousel.swift
//  SwiftUICarousel
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import SwiftUI


/*
 This is the whole snap carousel view to start
 */
struct SnapCarousel: View {
    @EnvironmentObject var UIState: CarouselStateModel

  
    var body: some View {
      /*
       You have given spacing of a float based on fixed numbbers
       with width and height of the cards fixed
       */
        let spacing: CGFloat = 16
        let padding: CGFloat = 32
        let cardHeight: CGFloat = 279
      
            Carousel(
                numberOfItems: CGFloat(items.count),
                spacing: spacing,
                padding: padding
            ) {
              //the following foreach loop, loops through the carousel id in the items array
              //for each items
                ForEach(items, id: \.self.id) { item in
                  //call upon the item calss
                  /*
                   with set id
                   spacing
                   width of card
                   card height
                   */

                  
                    CardView(
                        _id: Int(item.id),
                        spacing: spacing,
                        padding: padding,
                        cardHeight: cardHeight
                    ) {
                    
                    /*
                     Name of the card on the inside
                     */
                        VStack {
                          //where we will put in our picture
                          /*
                           Important because holdinig up all pictures
                           */
                            Text("\(item.name)")
                        }
                        
                    }
                  //how the cards will be shapped
                    .foregroundColor(Color.white)
                    .background(Color.gray)
                    .cornerRadius(8)
                    .shadow(color: Color.gray, radius: 4, x: 0, y: 4)
                    .transition(AnyTransition.slide)
                    .animation(.spring())
                }
            }
            .background(.blue)
    }
}





struct SnapCarousel_Previews: PreviewProvider {
    static var previews: some View {
        SnapCarousel()
    }
}
