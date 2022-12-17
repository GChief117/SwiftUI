//
//  WeekView.swift
//  FullProfile
//
//  Created by Nelson, Gunnar on 12/8/22.
//

import Foundation
import SwiftUI




struct WeekView: View {
  @State private var items: [Item] = []
  private static var count = 0
  
  
  var body: some View {
    List{
      ScrollView{
        VStack(alignment: .leading){
          Text("Week \(Self.count + 1)")
          ScrollView(.horizontal, showsIndicators: false) {
            HStack {
              ForEach(0 ..< 7) { item in
                VStack{
                  RoundedRectangle(cornerRadius: 20)
                    .frame(width: 145, height: 145)
                  Text("Day \(item + 1)")
                }
              }
            }
          }
          // .padding()
        }
        .padding()
        
        
        
      }
    }
  }
}



struct WeekView_Previews: PreviewProvider {
  static var previews: some View {
      WeekView()
  }
}
