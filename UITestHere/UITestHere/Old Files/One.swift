//
//  One.swift
//  UITestHere
//
//  Created by Maddali, Ramesh on 10/6/22.
//

import SwiftUI

struct One: View {
    @State private var color = Color.red
    @State var viewOpacity = 1.0
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color.black)
            .opacity(self.viewOpacity)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 2)) {
                    //self.color = Color.blue
                    self.viewOpacity = 0.3
                    
                }
            }
        FloatingCreateButton {
            self.viewOpacity = 0.3
            withAnimation(.easeInOut(duration: 2)) {
                //self.color = Color.blue
                self.viewOpacity = 1
                
            }
        }
    }
}

//struct One_Previews: PreviewProvider {
//    static var previews: some View {
//        One()
//    }
//}
