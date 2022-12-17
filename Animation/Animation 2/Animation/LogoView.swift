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
        GeometryReader { proxy in
            ZStack(){
                    Color(red: 0.75, green: 0.13, blue: 0.13)
                        .clipShape(MyCustomShape())
                    MyCustomShape()
                        .trim(from: strokeStart, to: strokeEnd)
                        .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round, miterLimit: 8))
                        .foregroundColor(.white)
                        .shadow(color: Color.gray, radius: 2, x: 0)
                    
                }
        } .frame(maxWidth: 250, maxHeight: 250)
        .onAppear() {
            Timer.scheduledTimer(withTimeInterval: 0.12, repeats: true) { timer in
                withAnimation(Animation.easeOut(duration: 0.55)) {
                    //self.strokeStart = self.strokeEnd - 0.15
                    self.strokeEnd += CGFloat.random(in: 0.075 ..<  0.115)
                }
                
                if (self.strokeEnd >= 2) {
                    if (self.resetStrokes) {
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
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



struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
