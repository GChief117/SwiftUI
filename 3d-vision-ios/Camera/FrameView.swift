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
//                Image(image, scale: 1.0, orientation: .up, label: label)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    .clipped()
                
            }
        }
        else {
            Color.black
        }
    }
}

//struct FrameView_Previews: PreviewProvider {
//    static var previews: some View {
//        FrameView()
//    }
//}
