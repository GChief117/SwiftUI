//
//  GeoFrameTest.swift
//  UITestHere
//
//  Created by Maddali, Ramesh on 10/23/22.
//

import SwiftUI

struct GeoFrameTest: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        OuterView()
    }
}

struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")
            HStack {
                Text("Left Green")
                InnerView()
                    .background(.green)
            }
            
            Text("Bottom")
        }
    }
}

struct InnerView: View {
    var body: some View {
        HStack {
            GeometryReader { geo in
                HStack {
                    Text("Left")
                        .background(.green)
                        .onTapGesture {
                            print("Global center: \(geo.frame(in: .global)) ")
                            // print("Custom center: \(geo.frame(in: .named("Custom")).midX) x \(geo.frame(in: .named("Custom")).midY)")
                            print("Local center: \(geo.frame(in: .local)) ")
                        }
                    Text("Center")
                    //.frame(maxWidth: .infinity)
                        .background(.blue)
                        .onTapGesture {
                            print("Global center: \(geo.frame(in: .global)) ")
                            // print("Custom center: \(geo.frame(in: .named("Custom")).midX) x \(geo.frame(in: .named("Custom")).midY)")
                            print("Local center: \(geo.frame(in: .local)) ")
                        }
                    Text("Right")
                }
            }
            //.background(.orange)
            
        }
    }
}

struct ContentView: View {
    var body: some View {
        OuterView()
            .background(.red)
            .coordinateSpace(name: "Custom")
    }
}
