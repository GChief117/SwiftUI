//
//  ContentView.swift
//  Move&Scale
//
//  Created by Nelson, Gunnar on 12/7/22.
//

import SwiftUI

struct ContentView: View {

    enum Constants {
        static let imageWidth = 200.0
        static let imageHeight = 200.0
    }

    @State var imageWidth: CGFloat = Constants.imageWidth
    @State var imageHeight: CGFloat = Constants.imageHeight
    @State var showLongText: Bool = false

    var body: some View {
        ScrollViewOffset {
            imagePlaceholder
                .overlay(alignment: .bottom) {
                    image
                }
            sendButton
            text
        } onOffsetChange: { offset in
            resizeImage(offset: offset)
        }
        .background(.orange)
    }
}

extension ContentView {
    private func resizeImage(offset: CGFloat) {
        let scale = 1.0 - (min(Constants.imageHeight, -offset) / Constants.imageHeight)
        imageWidth = Constants.imageWidth * scale
        imageHeight = Constants.imageHeight * scale
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
