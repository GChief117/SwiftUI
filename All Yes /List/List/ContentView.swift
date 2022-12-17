//
//  ContentView.swift
//  List
//
//  Created by Nelson, Gunnar on 12/8/22.
//

import SwiftUI

struct Restaurant: Identifiable {
       let id = UUID()
       let name: String
      //let days: String
   }



struct DayView: View{
  @StateObject var viewModel = ProfileModel()
  var stepPossition: String

  var body: some View {
    VStack{
      EditableRectangleProfileImage(viewModel: viewModel)
      Text("Day \(stepPossition)")
    }
  }
}


struct WeekView: View {
  @State private var editMode = EditMode.inactive
  static var count = 1
  
  
  var body: some View {
        VStack(alignment: .leading) {
          HStack{
            Text("Week 1")
            Spacer()
            Button(action: {
              WeekView.count += 1 // << add next page

            }) {
              Text("+Add Day")
            }
          }
          ScrollView(.horizontal, content: {
              HStack{
                  // create available pages
                ForEach(0..<WeekView.count, id: \.self) { i in
                      DayView(stepPossition: "\(i)").id(i) // inject
                  }
              }
          })
          }
          // .padding()
        .padding()
    }
  /*
  private var addButton: some View {
      switch editMode {
      case .inactive:
          return AnyView(
            Button(action: onAdd) {Text("+Add Day")})
      default:
          return AnyView(EmptyView())
      }
  }
  private func onAdd() {
    Self.count += 1
  }
  */
}
  


  
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      WeekView()
    }
}
