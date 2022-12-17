//
//  ContentView.swift
//  Paywall
//
//  Created by Nelson, Gunnar on 12/10/22.
//

import SwiftUI

struct ContentView: View {
  static var count = 1
  @ObservedObject var manager = MotionManager()
  @State var show = false


  
    var body: some View {
      ZStack(alignment: .centerFirstTextBaseline){
        Image("paywall2")
          .resizable()
          .frame(maxWidth: 1350, maxHeight: .infinity)
          .scaledToFill()
        
        
        HStack{


        }
        
        
        }
      
      }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
