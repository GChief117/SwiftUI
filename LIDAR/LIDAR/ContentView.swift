//
//  ContentView.swift
//  LIDAR
//
//  Created by Nelson, Gunnar on 10/5/22.
//

import SwiftUI
import CoreGraphics
import VideoToolbox
import UIKit
import ARKit

struct ContentView: View {
    let sizeH: CGFloat = 1440
    let sizeW: CGFloat = 1920
    //let rect = CGRect(x: 0, y: 0, width: 300, height: 300)
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
                                
                ZStack{
                  //  Rectangle()
                        MetalPointCloud(arData: arProvider,
                                    confSelection: selectedConfidence.rawValue,
                                    scaleMovement: $scaleMovement)
                    //    .border(Color.white, width: 4)
                    //    .contentShape(Rectangle())
                    //    .frame(width: 100, height: 100)
                    //    .position(x: 200, y: 200)
                        .frame(width: geo.size.width)
                    
                    
                    //Put the dept coordinates here
                    //showcase how the coordinates will be set in place
                    //between the x, y, and z estimation to start
                    //we want to showcase the measurements for how far the lidar lights are making
                    //to estimate the depth
                    ZStack(alignment: .leading){
                        Text("Depth Estimation")
                            .foregroundColor(.white)
                            .position(x: 100, y: 300)
                        Text("X: Y: Z:")
                            .foregroundColor(.white)
                            .position(x: 50, y: 350)

                    }
                
                        

                   /*
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: rect.width, height: rect.height)
                        .mask(HoleShapeMask(in: rect).fill(style: FillStyle(eoFill: true)))
                    */
                    // MetalTextureViewDepth(content: arProvider.depthContent, confSelection: .constant(0))
                    //    .frame(width: geo.size.width)
                    //MetalTextureViewConfidence(content: arProvider.confidenceContent)
                    //    .frame(width: geo.size.width)
                    
                }
                 
                    
                }
            }
            .padding()
            .background(.white)
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
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
