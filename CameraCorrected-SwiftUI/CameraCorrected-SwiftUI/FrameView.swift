//
//  FrameView.swift
//  3DVision
//
//  Created by Nelson, Gunnar on 9/2/22.
//

import SwiftUI

struct FrameView: View {
    
    var image: UIImage?
    private let label = Text("Camera Feed")
    var body: some View {
        if let image = image {
                GeometryReader{ geometry in
                    Image(uiImage: image)
                    //Image(image, scale: 1.0, orientation: .up, label: label)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                        .clipped()
                    
                        Rectangle()
                            .fill(.clear)
                            .border(Color.blue, width: 4)
                            .contentShape(Rectangle())
                            .frame(width: 100, height: 100)
                            .position(x: 200, y: 200)

                    
                    
                    
                }
            }
        else {
            Color.black
        }
    }
    }


struct MaskShape : Shape {
    var inset : UIEdgeInsets
    
    func path(in rect: CGRect) -> Path {
        var shape = Rectangle().path(in: rect)
        shape.addPath(Ellipse().path(in: rect.inset(by: inset)))
        return shape
    }
}




//struct FrameView_Previews: PreviewProvider {
//    static var previews: some View {
//        FrameView()
//    }
//}
