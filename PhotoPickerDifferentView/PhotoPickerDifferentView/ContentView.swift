//
//  ContentView.swift
//  PhotoPickerDifferentView
//
//  Created by Nelson, Gunnar on 12/9/22.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}


struct ViewB: View {

    @State private var displayPicker = false

    var body: some View {
        VStack {
            Text("This is View B")
            if displayPicker {
                PickerView()
                    .transition(.slide)
                    .animation(.easeInOut, value: displayPicker)
            }
        }
        .onAppear {
            displayPicker = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
