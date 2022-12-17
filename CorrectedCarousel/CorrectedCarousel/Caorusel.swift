//
//  Carousel.swift
//  xref-ios
//
//  Created by Maddali, Ramesh on 10/9/22.
//

import SwiftUI

struct Carousel<Items : View> : View {
  let items: Items
  let numberOfItems: CGFloat
  let spacing: CGFloat
  let padding: CGFloat
  let cardWidth: CGFloat
  let reviewImages: [UIImage]
  
  @GestureState var isDetectingDrag = false
  @EnvironmentObject var carouselState: UIStateModel
  @State var showFullScreenImage: Bool = false
  
  @inlinable public init(
    reviewImages: [UIImage],
    spacing: CGFloat,
    padding: CGFloat,
    width: CGFloat,
    @ViewBuilder _ items: () -> Items) {
      
      self.reviewImages = reviewImages
      self.items = items()
      self.numberOfItems = CGFloat(self.reviewImages.count)
      self.spacing = spacing
      self.padding = padding
      self.cardWidth = width
    }
  
  var body: some View {
    let totalSpacing = (numberOfItems - 1) * spacing
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
    .gesture(DragGesture().updating($isDetectingDrag) { currentState, gestureState, transaction in
      self.carouselState.screenDrag = Float(currentState.translation.width)
    }.onEnded { value in
      self.carouselState.screenDrag = 0
      
      if (value.translation.width < -50) {
        //go to right until last card only.
        if(self.carouselState.activeCard < Int(numberOfItems)-1) {
          self.carouselState.activeCard = self.carouselState.activeCard + 1 //critical point //change the position of the index
          let impactMed = UIImpactFeedbackGenerator(style: .medium)
          impactMed.impactOccurred()
        }
      }
      
      if (value.translation.width > 50) {
        //go to left
        if(self.carouselState.activeCard != 0 ) {
          self.carouselState.activeCard = self.carouselState.activeCard - 1 //critical point //change the position of the index
          let impactMed = UIImpactFeedbackGenerator(style: .medium)
          impactMed.impactOccurred()
          
        }
      }
    })
    .onTapGesture {
      self.showFullScreenImage = true
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .fullScreenCover(isPresented: $showFullScreenImage) {
      
    } content: {
      BinImageFullView(selectedImage: self.reviewImages[self.carouselState.activeCard])
    }
    
  }
}


