//
//  ContentView.swift
//  ScrollView
//
//  Created by Nelson, Gunnar on 12/9/22.
//

import SwiftUI
import Foundation


  

  struct DayView: View {
    @State private var steps = 7 // pages counter
    //var restaurant: Restaurant
    
    var body: some View {
      VStack(alignment: .leading){
        HStack{
          Text("Week 1")
          Spacer()
          Button(action: {
            self.steps -= 1 // << remove next page
            
          }) {
            Text("-Add Day")
              .foregroundColor(.red)
          }
          Button(action: {
            self.steps += 1 // << add next page
            
          }) {
            Text("+Add Day")
          }
          .padding(.leading, 10)
          .foregroundColor(Color.blue)
        }
        ScrollView(.horizontal, content: {
          HStack{
            // create available pages
            ForEach(0..<steps, id: \.self) { i in
              PageStep(stepPossition: "\(i+1)").id(i) // inject
            }
          }
        })
      }
    }
  }
  

//for a single day
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



