//
//  ContentView.swift
//  ListCounter
//
//  Created by Nelson, Gunnar on 12/11/22.
//

import SwiftUI
import Foundation


  

  struct ContentView: View {
    @State var steps = 1 // pages counter
    //var restaurant: Restaurant
    
    var body: some View {
      NavigationView{
        List{
          VStack(alignment: .leading){
            HStack{
              Text("Week 1")
              Spacer()
              /*
               Button(action: {
               steps -= 1 // << remove next page
               
               }) {
               Text("-Add Day")
               .foregroundColor(.red)
               }
               Button(action: {
               steps += 1 // << add next page
               
               }) {
               Text("+Add Day")
               }
               .padding(.leading, 10)
               .foregroundColor(Color.blue)
               */
            }
            ScrollView(.horizontal, content: {
              VStack{
                // create available pages
                ForEach(0..<steps, id: \.self) { i in
                  PageStep(stepPossition: "\(i+1)").id(i) // inject
                }
              }
            })
          }
          .navigationBarItems(leading:
                                Button(action: {
            steps -= 1 // << remove next page
            
          }) {
            Text("Remove Week-")
              .foregroundColor(.red)
          },
            trailing:
            Button(action: {
            steps += 1 // << add next page
            
          }) {
            Text("+Add Week")
          }
            .padding(.leading, 10)
            .foregroundColor(Color.blue))
          .navigationTitle("Profile")
        }
      }
     
    }
    
    
    private var addButton: some View {
      Button(action: onAdd) {Text("+Add Week")}
      }
    
    private var addDelete: some View{
      Button(action: onDelete) {Text("Remove Week-")}
      }
    
    
    private func onAdd() {
      //restaurants.append(Restaurant(name: "Week \(Self.count + 1)"))
      steps += 1
    }
    
    
    private func onDelete() {
      steps -= 1
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
