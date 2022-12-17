//
//  TestRun.swift
//  UITestHere
//
//  Created by Maddali, Ramesh on 10/18/22.
//

import SwiftUI

import SwiftUI

struct FloatingCreateButton: View {
    var action: () -> () = {}
   // var action2: () -> () = {}
    var body: some View {
        ZStack {
            HStack {
                
                Button(action: action) {
                    SwiftUI.Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.red)
                        .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
                }
                .frame(width: 80, height: 80)
                .padding(.trailing, 12)
                .padding(.bottom, 32)
                
                Spacer()
                
            
            }
            .background(.clear)
        }
        .background(.clear)
    }
}
