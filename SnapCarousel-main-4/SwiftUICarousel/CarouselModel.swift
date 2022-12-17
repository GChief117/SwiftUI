//
//  CarouselModel.swift
//  SwiftUICarousel
//
//  Created by Nelson, Gunnar on 11/11/22.
//

import Foundation
import SwiftUI

/*
 The complex version fo the carousel
 You have a series of items
 
 With a specifed nubmer of items
 Given spacing
 Wisth of cards
 Adding total space
 
 You have given detection
 */
struct Carousel<Items : View> : View {
    let items: Items
    let numberOfItems: CGFloat
    let spacing: CGFloat
    let padding: CGFloat
    let totalSpacing: CGFloat
    let cardWidth: CGFloat
    @GestureState var isDetectingLongPress = false
    @EnvironmentObject var carouselState: CarouselStateModel
        
    @inlinable public init(
        numberOfItems: CGFloat,
        spacing: CGFloat,
        padding: CGFloat,
        @ViewBuilder _ items: () -> Items) {
        self.items = items()
        self.numberOfItems = numberOfItems
        self.spacing = spacing
        self.padding = padding
        self.totalSpacing = (numberOfItems - 1) * spacing
        self.cardWidth = UIScreen.main.bounds.width - (padding*2) - (spacing*2)
    }
  
    //The functionality for how the cards will move based on dragging and activation
    var body: some View {

        let totalCanvasWidth: CGFloat = (cardWidth * numberOfItems) + totalSpacing
        let xOffsetToShift = (totalCanvasWidth - UIScreen.main.bounds.width) / 2
        let leftPadding = padding + spacing
        let totalMovement = cardWidth + spacing
                
        let activeOffset = xOffsetToShift + (leftPadding) - (totalMovement * CGFloat(carouselState.activeCard))
        let nextOffset = xOffsetToShift + (leftPadding) - (totalMovement * CGFloat(carouselState.activeCard) + 1)
        var calcOffset = Float(activeOffset)
        if (calcOffset != Float(nextOffset)) {
            calcOffset = Float(activeOffset) + carouselState.screenDrag
        }
        return HStack(alignment: .center, spacing: spacing) {
            items
        }
        .offset(x: CGFloat(calcOffset), y: 0)
        .gesture(DragGesture().updating($isDetectingLongPress) { currentState, gestureState, transaction in
            self.carouselState.screenDrag = Float(currentState.translation.width)
            
        }.onEnded { value in
            self.carouselState.screenDrag = 0
          
          //these two if statements with activeCard increase or decrease whenever there is a state occuring
          //goals is to change each of the values to indecies of an array
            if (value.translation.width < -50) &&  self.carouselState.activeCard < Int(numberOfItems) - 1 {
                self.carouselState.activeCard = self.carouselState.activeCard + 1 //critical point
                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                impactMed.impactOccurred()
            }
            if (value.translation.width > 50) && self.carouselState.activeCard > 0 {
                self.carouselState.activeCard = self.carouselState.activeCard - 1 //critical point
                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                impactMed.impactOccurred()
            }
        })
    }
}


/*
 This indicates when a card is being dragged
 vs the other card which is in the center
 */
public class CarouselStateModel: ObservableObject {
  @Published var screenDrag: Float = 0.0
  @Published var activeCard: Int = 0
}


/*
 This is the card sturcture which showcases the card ID
 and the name inside the card
 Allows us to create our array
 */
struct Card: Decodable, Hashable, Identifiable {
    var id: Int
    var name: String = ""
    var labels: String = ""
}





