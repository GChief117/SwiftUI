//
//  ContentView.swift
//  3DVision
//
//  Created by Nelson, Gunnar on 9/1/22.
//




import SwiftUI
import CoreGraphics
import VideoToolbox
import UIKit
import ARKit

struct ContentView: View {
    let sizeH: CGFloat = 1440
    let sizeW: CGFloat = 1920
    @StateObject var arProvider: ARProvider = ARProvider()
    let ciContext: CIContext = CIContext()
    private var selectedConfidence: ARConfidenceLevel = .high
    @State var isShowSmoothDepth = false
    @State private var scaleMovement: Float = 1
    
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                if
                    let buffer = arProvider.lastArData?.colorImage,
                    let uiImage = CGImage.uiCreate(from: buffer) {
                    FrameView(image: uiImage)
                        .edgesIgnoringSafeArea(.all)
                }
                ScrollView(.horizontal) {
                    HStack() {
                        MetalPointCloud(arData: arProvider,
                                        confSelection: selectedConfidence.rawValue,
                                        scaleMovement: $scaleMovement)
                            .frame(width: geo.size.width)
                        MetalTextureViewDepth(content: arProvider.depthContent, confSelection: .constant(0))
                            .frame(width: geo.size.width)
                        MetalTextureViewConfidence(content: arProvider.confidenceContent)
                            .frame(width: geo.size.width)
                    }
                }
            }
            .padding()
            .background(.white)
        }
    }
}


extension CGImage {
    static func cgCreateOriented(from cvPixelBuffer: CVPixelBuffer?) -> CGImage? {
        guard let pixelBuffer = cvPixelBuffer else {
            return nil
        }
        
        var ciImage = CIImage(cvPixelBuffer: pixelBuffer)
        ciImage = ciImage.oriented(CGImagePropertyOrientation.up)
        
        return ciImage.cgImage
    }
    
    
    static func cgCreate(from cvPixelBuffer: CVPixelBuffer?) -> CGImage? {
        guard let pixelBuffer = cvPixelBuffer else {
            return nil
        }
        
        var image: CGImage?
        VTCreateCGImageFromCVPixelBuffer(
            pixelBuffer,
            options: nil,
            imageOut: &image)
        
        
        return image
    }
    
    static func uiCreate(from cvPixelBuffer: CVPixelBuffer?) -> UIImage? {
        guard let cgImage = CGImage.cgCreate(from: cvPixelBuffer) else { return nil }
        // TODO: REVISIT IMAGE ORIENTATION - .right doesn't make sense
        let uiImage = UIImage(cgImage: cgImage, scale: 1, orientation: .right)
        return uiImage
    }
}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
