//
//  ContentView.swift
//  CropImage
//
//  Created by Nelson, Gunnar on 12/15/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        CropImage(imageName: "Your Image name here!")
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
