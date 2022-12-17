//
//  ImageCarousel.swift
//  xref-ios
//
//  Created by Ramesh 10/06/2022.
//

import SwiftUI

struct BinReviewCarousel: View {
  var carouselState: UIStateModel
  let imagesArray:[UIImage]
  let spacing: CGFloat = 16
  let padding: CGFloat = 32
  let cardHeight: CGFloat = 280
  var cards: [Card]
  init(reviewImages: [ReviewImage], state: UIStateModel) {
    self.imagesArray = reviewImages.map{$0.image}
    self.cards = imagesArray.enumerated().map { Card(id: $0.0, newImage: $0.1) }
    self.carouselState = state
  }
  var body: some View {
    return GeometryReader { geo in
      Carousel(reviewImages: imagesArray, spacing: spacing, padding: padding, width: geo.size.width - (padding*2)) {
        ForEach(self.cards, id: \.self.id) { card in
          CardView( _id: Int(card.id),
                    spacing: spacing,
                    padding: padding,
                    width: geo.size.width - (padding*2),
                    cardHeight: cardHeight) {
            SwiftUI.Image(uiImage: card.newImage)
              .resizable()
              .scaledToFill()
          }
                    .foregroundColor(Color.red)
                    .background(Color.black)
                    .cornerRadius(8)
                    .shadow(color: Color( "shadow1"), radius: 4, x: 0, y: 4)
                    .transition(AnyTransition.slide)
                    .animation(.spring())
        }
        
      }
      .environmentObject( self.carouselState )
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
      .background(Color.white.edgesIgnoringSafeArea(.all))
    }
  }
}

extension View {
  
  /// Hide or show the view based on a boolean value.
  ///
  /// Example for visibility:
  ///
  ///     Text("Label")
  ///         .isHidden(true)
  ///
  /// Example for complete removal:
  ///
  ///     Text("Label")
  ///         .isHidden(true, remove: true)
  ///
  /// - Parameters:
  ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
  ///   - remove: Boolean value indicating whether or not to remove the view.
  @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
    if hidden {
      if !remove {
        self.hidden()
      }
    } else {
      self
    }
  }
}


