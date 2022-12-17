//
//  ContentView.swift
//  ResturantList
//
//  Created by Nelson, Gunnar on 12/9/22.
//

import SwiftUI

import SwiftUI
    struct Restaurant: Identifiable {
        let id = UUID()
        let name: String
        let stars: String
    }
    
    struct RestaurantRow: View {
        var restaurant: Restaurant
    
        var body: some View {
            HStack
            {
                Image(systemName: "photo")
                Text("\(restaurant.name)")
                Text("Stars \(restaurant.stars)").foregroundColor(Color.yellow)
            }
            
             
        }
    }

struct ContentView: View {

    @State var restaurants = [
        Restaurant(name: "Joe's Original", stars: "5"),
        Restaurant(name: "The Real Joe's Original", stars: "4"),
        Restaurant(name: "Original Joe's", stars: "3")
    ]

    var body: some View {
        NavigationView{
            List(restaurants)
            { restaurant in
                RestaurantRow(restaurant: restaurant)
            }
            .navigationBarItems(
                trailing: Button(action: addRestaurant, label: { Text("Add")}))
            .navigationTitle("Table View Playground")
        }.refreshable {
            addRestaurant()
        }
    }
    func addRestaurant(){
        restaurants.append(Restaurant(name: "Joe's", stars: "2"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
