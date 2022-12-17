//
//  ContentView.swift
//  CameraCorrected-SwiftUI
//
//  Created by Nelson, Gunnar on 10/5/22.
//

import SwiftUI
import UIKit
import VideoToolbox
import ARKit




struct ContentView: View {
    let ciContext: CIContext = CIContext()
    private var selectedConfidence: ARConfidenceLevel = .high
    
    var body: some View {
        VStack {
            let buffer = arProvider.lastArData?.colorImage,
            let uiImage = CGImage.uiCreate(from: buffer) {
                
                FrameView(image: uiImage)
                    .edgesIgnoringSafeArea(.all)
            }
        }
        .padding()
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
