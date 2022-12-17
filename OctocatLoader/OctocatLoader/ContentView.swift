//
//  ContentView.swift
//  OctocatLoader
//
//  Created by Nelson, Gunnar on 11/29/22.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack{
      OctocatView()
    }
    .padding()
    .ignoresSafeArea(.all)
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
