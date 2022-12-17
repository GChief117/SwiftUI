//
//  SwiftPracticeImagesApp.swift
//  SwiftPracticeImages
//
//  Created by Nelson, Gunnar on 12/9/22.
//


import SwiftUI

@main
struct ImageGalleryApp: App {
    @StateObject var dataModel = DataModel()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                GridView()
            }
            .environmentObject(dataModel)
            .navigationViewStyle(.stack)
        }
    }
}
