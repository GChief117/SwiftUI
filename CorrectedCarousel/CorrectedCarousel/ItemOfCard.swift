//
//  ItemOfCard.swift
//  SwiftUICarousel
//
//  Created by Nelson, Gunnar on 11/11/22.
//

import Foundation
import SwiftUI




/*
 The content of the card
 */
struct CardView<Content: View>: View {
    @EnvironmentObject var carouselState: CarouselStateModel
    let cardWidth: CGFloat
    let cardHeight: CGFloat
    var _id: Int
    var content: Content

    @inlinable public init(
        _id: Int,
        spacing: CGFloat,
        padding: CGFloat,
        cardHeight: CGFloat,
        @ViewBuilder _ content: () -> Content
    ) {
        self.content = content()
        self.cardWidth = UIScreen.main.bounds.width - (padding*2) - (spacing*2)
        self.cardHeight = cardHeight
        self._id = _id
    }

    var body: some View {
        content
            .frame(width: cardWidth, height: _id == carouselState.activeCard ? cardHeight : cardHeight - 60, alignment: .center)
    }
}



let items = [
  Card(id: 0, name: "Hey", labels: "Bin Content image"),
  Card(id: 1, name: "Ho", labels: "Product image"),
  Card(id: 2, name: "Lets", labels: "Label image"),
]
