//
//  ContentView.swift
//  ScrollView
//
//  Created by Nelson, Gunnar on 12/9/22.
//

import SwiftUI
import Foundation

  
  
  struct DayView: View {
    @State var steps = 8 // pages counter
    
    var body: some View {
      VStack(alignment: .leading){
        ScrollView(.horizontal, content: {
          HStack{
            // create available pages
            ForEach(1..<steps, id: \.self) { i in
              PageStep(stepPossition: "\(i+1 * ((ListView.count-1) * 7))").id(i) // inject
            }
          }
        })
      }
    }
  }
  
  struct PageStep: View {
    var stepPossition: String
    @StateObject var viewModel = ProfileModel()
    
    var body: some View {
      
      VStack{
        EditableRectangleProfileImage(viewModel: viewModel)
        Text("Day \(stepPossition)")
      }
    }
  }

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView()
    }
}
