//
//  ContentView.swift
//  ColorPathFill
//
//  Created by Nelson, Gunnar on 11/30/22.
//

import SwiftUI


struct ContentView: View
{
  var body: some View {
    Color(red: 0.75, green: 0.13, blue: 0.13)
      .frame(width: 300, height: 300)
      .clipShape(OctocatShape())
    
    
  }
}
    
    /*
    let path = Path { path in
      path.addArc(center: CGPoint(x: 100, y: 300), radius: 200, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
      path.closeSubpath()
    }
    path.fill(Color.red).overlay(path.stroke(Color.black, lineWidth: 2))
  }
}
*/
    
    
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
