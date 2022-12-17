//
//  ContentView.swift
//  DaysofTheWeek
//
//  Created by Nelson, Gunnar on 12/8/22.
//

import SwiftUI

   /*
   struct RestaurantRow: View {
       var restaurant: Restaurant
      @StateObject var viewModel = ProfileModel()

   
       var body: some View {
         VStack (alignment: .leading){
               //Text("\(restaurant.name)")
                 //DayView()
               }
             }
           }
            */
/*
struct Restaurant: Identifiable {
       let id = UUID()
       let name: String
      //let days: String
   }
 */

struct ContentView: View {
  
  
  //@State var restaurants = [
    //Restaurant(name: "Week 1"),
  //]
  
  static var count = 1
  
  
  var body: some View {
    NavigationView{
      List(){
        ScrollView(.vertical, content: {
          DayView()
            .navigationBarItems(leading: addDelete, trailing: addButton)
            .navigationTitle("Profile")
        })
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
    Self.count += 1
  }
  
  
  private func onDelete() {
    Self.count -= 1
  }
  
  
  
  
  struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
  }
}
