//
//  OctocatLoader.swift
//  SwiftUI-Animations
//
//  Created by Shubham on 12/10/21.
//  Copyright © 2021 Shubham Singh. All rights reserved.
//
import SwiftUI

struct OctocatShape: Shape {
  
  func path(in rect: CGRect) -> Path {
      var path = Path()
      let width = rect.size.width
      let height = rect.size.height
      path.move(to: CGPoint(x: 0.94591*width, y: 0.3506*height))
      path.addLine(to: CGPoint(x: 0.72138*width, y: 0.3506*height))
      path.addLine(to: CGPoint(x: 0.71824*width, y: 0.3506*height))
      path.addLine(to: CGPoint(x: 0.71635*width, y: 0.34881*height))
      path.addLine(to: CGPoint(x: 0.70943*width, y: 0.34226*height))
      path.addLine(to: CGPoint(x: 0.70126*width, y: 0.33214*height))
      path.addLine(to: CGPoint(x: 0.68994*width, y: 0.31786*height))
      path.addLine(to: CGPoint(x: 0.67925*width, y: 0.30774*height))
      path.addLine(to: CGPoint(x: 0.66226*width, y: 0.29167*height))
      path.addLine(to: CGPoint(x: 0.64277*width, y: 0.27738*height))
      path.addLine(to: CGPoint(x: 0.63019*width, y: 0.26905*height))
      path.addLine(to: CGPoint(x: 0.61069*width, y: 0.25893*height))
      path.addLine(to: CGPoint(x: 0.58491*width, y: 0.24881*height))
      path.addLine(to: CGPoint(x: 0.56164*width, y: 0.24286*height))
      path.addLine(to: CGPoint(x: 0.53585*width, y: 0.23869*height))
      path.addLine(to: CGPoint(x: 0.49308*width, y: 0.23929*height))
      path.addLine(to: CGPoint(x: 0.47799*width, y: 0.24048*height))
      path.addLine(to: CGPoint(x: 0.45975*width, y: 0.24524*height))
      path.addLine(to: CGPoint(x: 0.43899*width, y: 0.2506*height))
      path.addLine(to: CGPoint(x: 0.4239*width, y: 0.25714*height))
      path.addLine(to: CGPoint(x: 0.40692*width, y: 0.26488*height))
      path.addLine(to: CGPoint(x: 0.38742*width, y: 0.27738*height))
      path.addLine(to: CGPoint(x: 0.36855*width, y: 0.29167*height))
      path.addLine(to: CGPoint(x: 0.34906*width, y: 0.30952*height))
      path.addLine(to: CGPoint(x: 0.33396*width, y: 0.32619*height))
      path.addLine(to: CGPoint(x: 0.31887*width, y: 0.34643*height))
      path.addLine(to: CGPoint(x: 0.30377*width, y: 0.36905*height))
      path.addLine(to: CGPoint(x: 0.28931*width, y: 0.39762*height))
      path.addLine(to: CGPoint(x: 0.27799*width, y: 0.42381*height))
      path.addLine(to: CGPoint(x: 0.2717*width, y: 0.44226*height))
      path.addLine(to: CGPoint(x: 0.26541*width, y: 0.46845*height))
      path.addLine(to: CGPoint(x: 0.26101*width, y: 0.49643*height))
      path.addLine(to: CGPoint(x: 0.25912*width, y: 0.52143*height))
      path.addLine(to: CGPoint(x: 0.25912*width, y: 0.56012*height))
      path.addLine(to: CGPoint(x: 0.26101*width, y: 0.56845*height))
      path.addLine(to: CGPoint(x: 0.26289*width, y: 0.58571*height))
      path.addLine(to: CGPoint(x: 0.26541*width, y: 0.59881*height))
      path.addLine(to: CGPoint(x: 0.2717*width, y: 0.625*height))
      path.addLine(to: CGPoint(x: 0.27421*width, y: 0.63274*height))
      path.addLine(to: CGPoint(x: 0.28239*width, y: 0.65357*height))
      path.addLine(to: CGPoint(x: 0.29308*width, y: 0.67143*height))
      path.addLine(to: CGPoint(x: 0.31258*width, y: 0.69583*height))
      path.addLine(to: CGPoint(x: 0.33585*width, y: 0.71667*height))
      path.addLine(to: CGPoint(x: 0.35094*width, y: 0.72619*height))
      path.addLine(to: CGPoint(x: 0.38365*width, y: 0.74048*height))
      path.addLine(to: CGPoint(x: 0.41132*width, y: 0.74881*height))
      path.addLine(to: CGPoint(x: 0.4327*width, y: 0.75298*height))
      path.addLine(to: CGPoint(x: 0.44774*width, y: 0.75476*height))
      path.addLine(to: CGPoint(x: 0.48428*width, y: 0.75476*height))
      path.addLine(to: CGPoint(x: 0.50818*width, y: 0.7506*height))
      path.addLine(to: CGPoint(x: 0.54465*width, y: 0.73869*height))
      path.addLine(to: CGPoint(x: 0.56164*width, y: 0.73036*height))
      path.addLine(to: CGPoint(x: 0.59182*width, y: 0.71012*height))
      path.addLine(to: CGPoint(x: 0.61509*width, y: 0.6881*height))
      path.addLine(to: CGPoint(x: 0.63208*width, y: 0.66786*height))
      path.addLine(to: CGPoint(x: 0.65157*width, y: 0.63929*height))
      path.addLine(to: CGPoint(x: 0.65157*width, y: 0.6369*height))
      path.addLine(to: CGPoint(x: 0.40063*width, y: 0.6369*height))
      path.addLine(to: CGPoint(x: 0.40063*width, y: 0.62083*height))
      path.addLine(to: CGPoint(x: 0.40503*width, y: 0.59405*height))
      path.addLine(to: CGPoint(x: 0.41132*width, y: 0.55238*height))
      path.addLine(to: CGPoint(x: 0.41572*width, y: 0.52738*height))
      path.addLine(to: CGPoint(x: 0.42201*width, y: 0.49107*height))
      path.addLine(to: CGPoint(x: 0.42642*width, y: 0.46845*height))
      path.addLine(to: CGPoint(x: 0.43019*width, y: 0.45833*height))
      path.addLine(to: CGPoint(x: 0.43899*width, y: 0.44821*height))
      path.addLine(to: CGPoint(x: 0.44591*width, y: 0.44405*height))
      path.addLine(to: CGPoint(x: 0.9761*width, y: 0.44405*height))
      path.addLine(to: CGPoint(x: 0.9761*width, y: 0.46071*height))
      path.addLine(to: CGPoint(x: 0.9717*width, y: 0.48274*height))
      path.addLine(to: CGPoint(x: 0.96981*width, y: 0.49881*height))
      path.addLine(to: CGPoint(x: 0.9673*width, y: 0.50893*height))
      path.addLine(to: CGPoint(x: 0.96541*width, y: 0.525*height))
      path.addLine(to: CGPoint(x: 0.96101*width, y: 0.55298*height))
      path.addLine(to: CGPoint(x: 0.95849*width, y: 0.56786*height))
      path.addLine(to: CGPoint(x: 0.9566*width, y: 0.57857*height))
      path.addLine(to: CGPoint(x: 0.95472*width, y: 0.59226*height))
      path.addLine(to: CGPoint(x: 0.94843*width, y: 0.62917*height))
      path.addLine(to: CGPoint(x: 0.94591*width, y: 0.64524*height))
      path.addLine(to: CGPoint(x: 0.9434*width, y: 0.65714*height))
      path.addLine(to: CGPoint(x: 0.94151*width, y: 0.66786*height))
      path.addLine(to: CGPoint(x: 0.93962*width, y: 0.68155*height))
      path.addLine(to: CGPoint(x: 0.93711*width, y: 0.69405*height))
      path.addLine(to: CGPoint(x: 0.9327*width, y: 0.71845*height))
      path.addLine(to: CGPoint(x: 0.92642*width, y: 0.75714*height))
      path.addLine(to: CGPoint(x: 0.92013*width, y: 0.79464*height))
      path.addLine(to: CGPoint(x: 0.91195*width, y: 0.84405*height))
      path.addLine(to: CGPoint(x: 0.90063*width, y: 0.90774*height))
      path.addLine(to: CGPoint(x: 0.89874*width, y: 0.92262*height))
      path.addLine(to: CGPoint(x: 0.89686*width, y: 0.93571*height))
      path.addLine(to: CGPoint(x: 0.89434*width, y: 0.94583*height))
      path.addLine(to: CGPoint(x: 0.89182*width, y: 0.95357*height))
      path.addLine(to: CGPoint(x: 0.88994*width, y: 0.95774*height))
      path.addLine(to: CGPoint(x: 0.88805*width, y: 0.9619*height))
      path.addLine(to: CGPoint(x: 0.88553*width, y: 0.96429*height))
      path.addLine(to: CGPoint(x: 0.88365*width, y: 0.96607*height))
      path.addLine(to: CGPoint(x: 0.87925*width, y: 0.97024*height))
      path.addLine(to: CGPoint(x: 0.87296*width, y: 0.97262*height))
      path.addLine(to: CGPoint(x: 0.67987*width, y: 0.97262*height))
      path.addLine(to: CGPoint(x: 0.67987*width, y: 0.96726*height))
      path.addLine(to: CGPoint(x: 0.67987*width, y: 0.9619*height))
      path.addLine(to: CGPoint(x: 0.67987*width, y: 0.93333*height))
      path.addLine(to: CGPoint(x: 0.67925*width, y: 0.93333*height))
      path.addLine(to: CGPoint(x: 0.67799*width, y: 0.93333*height))
      path.addLine(to: CGPoint(x: 0.67107*width, y: 0.93333*height))
      path.addLine(to: CGPoint(x: 0.67107*width, y: 0.93571*height))
      path.addLine(to: CGPoint(x: 0.64969*width, y: 0.95*height))
      path.addLine(to: CGPoint(x: 0.6283*width, y: 0.96012*height))
      path.addLine(to: CGPoint(x: 0.6044*width, y: 0.97024*height))
      path.addLine(to: CGPoint(x: 0.58302*width, y: 0.97857*height))
      path.addLine(to: CGPoint(x: 0.55535*width, y: 0.98631*height))
      path.addLine(to: CGPoint(x: 0.51635*width, y: 0.99464*height))
      path.addLine(to: CGPoint(x: 0.48428*width, y: 0.99881*height))
      path.addLine(to: CGPoint(x: 0.40503*width, y: 0.99881*height))
      path.addLine(to: CGPoint(x: 0.38742*width, y: 0.99643*height))
      path.addLine(to: CGPoint(x: 0.37296*width, y: 0.99464*height))
      path.addLine(to: CGPoint(x: 0.34277*width, y: 0.98869*height))
      path.addLine(to: CGPoint(x: 0.31258*width, y: 0.98036*height))
      path.addLine(to: CGPoint(x: 0.27799*width, y: 0.96786*height))
      path.addLine(to: CGPoint(x: 0.24151*width, y: 0.95179*height))
      path.addLine(to: CGPoint(x: 0.22013*width, y: 0.93929*height))
      path.addLine(to: CGPoint(x: 0.20314*width, y: 0.92976*height))
      path.addLine(to: CGPoint(x: 0.18176*width, y: 0.91548*height))
      path.addLine(to: CGPoint(x: 0.15157*width, y: 0.89048*height))
      path.addLine(to: CGPoint(x: 0.13459*width, y: 0.875*height))
      path.addLine(to: CGPoint(x: 0.11321*width, y: 0.85238*height))
      path.addLine(to: CGPoint(x: 0.09182*width, y: 0.82619*height))
      path.addLine(to: CGPoint(x: 0.07421*width, y: 0.80119*height))
      path.addLine(to: CGPoint(x: 0.05912*width, y: 0.77679*height))
      path.addLine(to: CGPoint(x: 0.04403*width, y: 0.74643*height))
      path.addLine(to: CGPoint(x: 0.03333*width, y: 0.72262*height))
      path.addLine(to: CGPoint(x: 0.02264*width, y: 0.69167*height))
      path.addLine(to: CGPoint(x: 0.01006*width, y: 0.64286*height))
      path.addLine(to: CGPoint(x: 0.00377*width, y: 0.60476*height))
      path.addLine(to: CGPoint(x: 0.00126*width, y: 0.58452*height))
      path.addLine(to: CGPoint(x: 0.00126*width, y: 0.49643*height))
      path.addLine(to: CGPoint(x: 0.00377*width, y: 0.47679*height))
      path.addLine(to: CGPoint(x: 0.00755*width, y: 0.44821*height))
      path.addLine(to: CGPoint(x: 0.01006*width, y: 0.4381*height))
      path.addLine(to: CGPoint(x: 0.01195*width, y: 0.42798*height))
      path.addLine(to: CGPoint(x: 0.01384*width, y: 0.41786*height))
      path.addLine(to: CGPoint(x: 0.01887*width, y: 0.3994*height))
      path.addLine(to: CGPoint(x: 0.02704*width, y: 0.37262*height))
      path.addLine(to: CGPoint(x: 0.03585*width, y: 0.34821*height))
      path.addLine(to: CGPoint(x: 0.04025*width, y: 0.3369*height))
      path.addLine(to: CGPoint(x: 0.04654*width, y: 0.32202*height))
      path.addLine(to: CGPoint(x: 0.05283*width, y: 0.30833*height))
      path.addLine(to: CGPoint(x: 0.06164*width, y: 0.29167*height))
      path.addLine(to: CGPoint(x: 0.07233*width, y: 0.27083*height))
      path.addLine(to: CGPoint(x: 0.08302*width, y: 0.25298*height))
      path.addLine(to: CGPoint(x: 0.0956*width, y: 0.23274*height))
      path.addLine(to: CGPoint(x: 0.10881*width, y: 0.21429*height))
      path.addLine(to: CGPoint(x: 0.13836*width, y: 0.17738*height))
      path.addLine(to: CGPoint(x: 0.17547*width, y: 0.13929*height))
      path.addLine(to: CGPoint(x: 0.20314*width, y: 0.11488*height))
      path.addLine(to: CGPoint(x: 0.21635*width, y: 0.10476*height))
      path.addLine(to: CGPoint(x: 0.22264*width, y: 0.1006*height))
      path.addLine(to: CGPoint(x: 0.23333*width, y: 0.09286*height))
      path.addLine(to: CGPoint(x: 0.24843*width, y: 0.08214*height))
      path.addLine(to: CGPoint(x: 0.25912*width, y: 0.07619*height))
      path.addLine(to: CGPoint(x: 0.29371*width, y: 0.05595*height))
      path.addLine(to: CGPoint(x: 0.30629*width, y: 0.05*height))
      path.addLine(to: CGPoint(x: 0.33396*width, y: 0.0375*height))
      path.addLine(to: CGPoint(x: 0.37233*width, y: 0.02321*height))
      path.addLine(to: CGPoint(x: 0.42138*width, y: 0.01012*height))
      path.addLine(to: CGPoint(x: 0.48428*width, y: 0.00119*height))
      path.addLine(to: CGPoint(x: 0.50818*width, y: 0.00119*height))
      path.addLine(to: CGPoint(x: 0.57044*width, y: 0.00119*height))
      path.addLine(to: CGPoint(x: 0.6044*width, y: 0.00476*height))
      path.addLine(to: CGPoint(x: 0.61509*width, y: 0.00714*height))
      path.addLine(to: CGPoint(x: 0.64528*width, y: 0.0131*height))
      path.addLine(to: CGPoint(x: 0.66855*width, y: 0.01905*height))
      path.addLine(to: CGPoint(x: 0.68616*width, y: 0.0256*height))
      path.addLine(to: CGPoint(x: 0.70755*width, y: 0.03452*height))
      path.addLine(to: CGPoint(x: 0.76541*width, y: 0.06131*height))
      path.addLine(to: CGPoint(x: 0.78365*width, y: 0.06845*height))
      path.addLine(to: CGPoint(x: 0.78365*width, y: 0.05714*height))
      path.addLine(to: CGPoint(x: 0.78679*width, y: 0.05*height))
      path.addLine(to: CGPoint(x: 0.78994*width, y: 0.04405*height))
      path.addLine(to: CGPoint(x: 0.79748*width, y: 0.0381*height))
      path.addLine(to: CGPoint(x: 0.8044*width, y: 0.03452*height))
      path.addLine(to: CGPoint(x: 0.81132*width, y: 0.03274*height))
      path.addLine(to: CGPoint(x: 0.99874*width, y: 0.03274*height))
      path.addLine(to: CGPoint(x: 0.94591*width, y: 0.3506*height))
      path.closeSubpath()
      return path
  }
    
    // MARK:- variables
    
    // MARK:- functions
  /*
    func path(in rect: CGRect) -> Path {
        
        let cX: CGFloat = rect.midX
        let cY: CGFloat = rect.midY
        
        var path = Path()
        
        path.move(to: CGPoint(x: cX + 24.07, y: cY + 77.5))
        
        /// right
        path.addLine(to: CGPoint(x: cX + 24.07, y: cY + 52.94))
        path.addLine(to: CGPoint(x: cX + 24.06, y: cY + 53.12))
        path.addCurve(to: CGPoint(x: cX + 18.14, y: cY + 36.4), control1: CGPoint(x: cX + 24.6, y: cY + 46.95), control2: CGPoint(x: cX + 22.44, y: cY + 40.85))
        path.addCurve(to: CGPoint(x: cX + 58.99, y: cY + -8.06), control1: CGPoint(x: cX + 38.04, y: cY + 34.15), control2: CGPoint(x: cX + 58.99, y: cY + 26.6))
        path.addLine(to: CGPoint(x: cX + 58.99, y: cY + -8.06))
        path.addCurve(to: CGPoint(x: cX + 49.3, y: cY + -32.04), control1: CGPoint(x: cX + 58.99, y: cY + -17), control2: CGPoint(x: cX + 55.52, y: cY + -25.6))
        path.addLine(to: CGPoint(x: cX + 49.56, y: cY + -32.1))
        path.addCurve(to: CGPoint(x: cX + 48.72, y: cY + -56.2), control1: CGPoint(x: cX + 52.41, y: cY + -39.94), control2: CGPoint(x: cX + 52.11, y: cY + -48.58))
        path.addCurve(to: CGPoint(x: cX + 24.08, y: cY + -46.4), control1: CGPoint(x: cX + 48.9, y: cY + -55.79), control2: CGPoint(x: cX + 41.41, y: cY + -58.02))
        
        
        path.addLine(to: CGPoint(x: cX + 23.84, y: cY + -46.46))
        
        /// top
        path.addCurve(to: CGPoint(x: cX + -20.12, y: cY + -46.46), control1: CGPoint(x: cX + 9.44, y: cY + -50.32), control2: CGPoint(x: cX + -5.72, y: cY + -50.32))
        
        
        // left
        path.addCurve(to: CGPoint(x: cX + -45.17, y: cY + -55.79), control1: CGPoint(x: cX + -37.69, y: cY + -58.01), control2: CGPoint(x: cX + -45.11, y: cY + -55.79))
        path.addLine(to: CGPoint(x: cX + -45.22, y: cY + -55.69))
        path.addCurve(to: CGPoint(x: cX + -45.64, y: cY + -31.58), control1: CGPoint(x: cX + -48.48, y: cY + -48.01), control2: CGPoint(x: cX + -48.63, y: cY + -39.37))
        path.addLine(to: CGPoint(x: cX + -45.58, y: cY + -32.04))
        path.addCurve(to: CGPoint(x: cX + -55.27, y: cY + -8.05), control1: CGPoint(x: cX + -51.79, y: cY + -25.6), control2: CGPoint(x: cX + -55.27, y: cY + -17))
        path.addCurve(to: CGPoint(x: cX + -14.39, y: cY + 36.56), control1: CGPoint(x: cX + -55.27, y: cY + 26.53), control2: CGPoint(x: cX + -34.32, y: cY + 34.09))
        path.addLine(to: CGPoint(x: cX + -14.4, y: cY + 36.58))
        path.addCurve(to: CGPoint(x: cX + -20.36, y: cY + 52.93), control1: CGPoint(x: cX + -18.62, y: cY + 40.94), control2: CGPoint(x: cX + -20.78, y: cY + 46.88))
        path.addLine(to: CGPoint(x: cX + -20.36, y: cY + 77.5))
        
        
        // tail
        path.move(to: CGPoint(x: cX + -20.36, y: cY + 58.46))
        path.addCurve (to: CGPoint(x: cX + -64.79, y: cY + 39.42), control1: CGPoint(x: cX + -52.09, y: cY + 67.98), control2: CGPoint(x: cX + -52.09, y: cY + 42.59))
        
        
        return path
    }
   */
}

struct OctocatShape_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            OctocatShape()
            //                .trim(from: 0, to: 0.2)
                .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round, miterLimit: 8))
                .foregroundColor(Color.white)
        }
    }
}
