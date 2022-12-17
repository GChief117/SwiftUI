//
//  CarouselApp.swift
//  Carousel
//
//  Created by Nelson, Gunnar on 11/11/22.
//

import SwiftUI

@main
struct CarouselApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(planet: planetsData[0])
        }
    }
}
