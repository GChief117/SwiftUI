//
//  ContentView.swift
//  PinchandScale
//
//  Created by Nelson, Gunnar on 12/9/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { proxy in
            Image("mountain")
                .resizable()
                .scaledToFit()
                .clipShape(Rectangle())
                .modifier(ImageModifier(contentSize: CGSize(width: proxy.size.width, height: proxy.size.height)))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
