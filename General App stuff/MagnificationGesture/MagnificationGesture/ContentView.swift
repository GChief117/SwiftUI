//
//  ContentView.swift
//  MagnificationGesture
//
//  Created by Gunnar Beck on 12/5/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { proxy in
            Image("mountain")
                .resizable()
                .frame(width: 275, height: 255)
                .scaledToFit()
                .clipShape(Rectangle())
            
            
                .modifier(ImageModifier(contentSize: CGSize(width: 275, height: 255)))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
