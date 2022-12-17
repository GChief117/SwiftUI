//
//  LogoView.swift
//  Landmarks
//
//  Created by Nelson, Gunnar on 11/16/22.
//  Copyright © 2022 Apple. All rights reserved.
//

import SwiftUI

struct LogoView: View {
    
    // MARK:- variables
    @State var resetStrokes: Bool = true
    @State var strokeStart: CGFloat = 0
    @State var strokeEnd: CGFloat = 0
    
    
    
    // MARK:- views
    var body: some View {
        ZStack{
        Color.black.ignoresSafeArea()

        GeometryReader { proxy in
            VStack{
                MyCustomShape()
                    .trim(from: strokeStart, to: strokeEnd)
                    .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round, miterLimit: 8))
                    .foregroundColor(.mint)
                    .shadow(color: Color.mint, radius: 2, x: 0)
                }

        } .frame(width: 300, height: 300)
            .onAppear() {
                Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { timer in
                    withAnimation(Animation.easeOut(duration: 20)) {
                        //self.strokeStart = self.strokeEnd - 0.15
                        self.strokeEnd += CGFloat.random(in: 0.075 ..<  0.08)
                    }
                    
                    if (self.strokeEnd >= 2) {
                        if (self.resetStrokes) {
                            Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
                                self.strokeEnd = 0
                                self.strokeStart = 0
                                self.resetStrokes.toggle()
                            }
                            self.resetStrokes = false
                        }
                    }
                }
            }
        
        }
    }
    
}



struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
