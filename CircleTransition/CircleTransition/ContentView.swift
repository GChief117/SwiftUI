//
//  ContentView.swift
//  CircleTransition
//
//  Created by Nelson, Gunnar on 11/17/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingCircleTransition = false
    //@State var contentMode = ContentMode.fit


    var body: some View {
        ZStack {
          SwiftUI.Image("grainger-logo")
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: 250, height: 230)
              .clipped()

            if isShowingCircleTransition {
                AuthenticateView()
                    .transition(.iris)
                    .zIndex(1)
                    .aspectRatio(contentMode: .fill)
 
            }
        }
        .onAppear {
          withAnimation(.easeInOut(duration: 50)) {
              //self.contentMode = ContentMode.fill
              isShowingCircleTransition.toggle()

            }
        }
    }
}



struct ScaledCircle: Shape {
    // This controls the size of the circle inside the
    // drawing rectangle. When it's 0 the circle is
    // invisible, and when it’s 1 the circle fills
    // the rectangle.
    var animatableData: Double

    func path(in rect: CGRect) -> Path {
        let maximumCircleRadius = (rect.width * rect.width + rect.height * rect.height)
        let circleRadius = maximumCircleRadius * animatableData

        let x = rect.midX - circleRadius / 2
        let y = rect.midY - circleRadius / 2

        let circleRect = CGRect(x: x, y: y, width: circleRadius, height: circleRadius)

        return Circle().path(in: circleRect)
    }
}

// A general modifier that can clip any view using a any shape.
struct ClipShapeModifier<T: Shape>: ViewModifier {
    let shape: T

    func body(content: Content) -> some View {
        content.clipShape(shape)
    }
}

// A custom transition combining ScaledCircle and ClipShapeModifier.
extension AnyTransition {
    static var iris: AnyTransition {
        .modifier(
            active: ClipShapeModifier(shape: ScaledCircle(animatableData: 0)),
            identity: ClipShapeModifier(shape: ScaledCircle(animatableData: 1))
        )
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

