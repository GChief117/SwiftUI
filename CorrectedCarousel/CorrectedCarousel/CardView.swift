//
//  CardView.swift
//  xref-ios
//
//  Created by Maddali, Ramesh on 10/9/22.
//

import SwiftUI

struct CardView<Content: View>: View {
  @EnvironmentObject var carouselState: UIStateModel
  let cardWidth: CGFloat
  let cardHeight: CGFloat
  var _id: Int
  var content: Content
  
  @inlinable public init(
    _id: Int,
    spacing: CGFloat,
    padding: CGFloat,
    width: CGFloat,
    cardHeight: CGFloat,
    @ViewBuilder _ content: () -> Content
  ) {
    self.content = content()
    self.cardWidth = width
    self.cardHeight = cardHeight
    self._id = _id
  }
  
  var body: some View {
    content
      .frame(width: cardWidth, height: _id == carouselState.activeCard ? cardHeight : cardHeight - 60, alignment: .center)
  }
}

