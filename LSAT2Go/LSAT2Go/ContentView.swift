//
//  ContentView.swift
//  LSAT2Go
//
//  Created by Gunnar Beck on 12/16/22.
//

import SwiftUI

/*
 This is our Tab view
 users can make a selection
 by tagging each navigation item
 For instnace, with just our tab view of library
 we are currently gazing at the library view
 Applied as a mask
 */
struct TabBar: View {
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            TabView(){
                ProfileView()
                        .tabItem ({
                            Image(systemName: "figure.run")
                            Text("Profile")
                        })
                CaloricView()
                    .tabItem ({
                        Image(systemName: "dumbbell")
                        Text("Caloric Goal")
                    })
                MacrosView()
                    .tabItem ({
                        Image(systemName: "fork.knife.circle")
                        Text("Macros")
                    })
                ProgressView()
                    .tabItem ({
                        Image(systemName: "sun.dust.fill")
                        Text("Progress")
                    })
                ForumView()
                    .tabItem ({
                        Image(systemName: "bolt.horizontal.circle")
                        Text("Forum")
                    })
            }
            
        })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
