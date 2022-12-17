//
//  Steos.swift
//  List
//
//  Created by Nelson, Gunnar on 12/11/22.
//

import Foundation
import SwiftUI

enum Step1 {
    struct DemoList: View {
        @State private var items: [Item] = (0..<5).map { Item(title: "Item #\($0)") }
        
        var body: some View {
            List {
                ForEach(items) { item in
                    Text(item.title)
                }
            }
        }
    }
}

enum Step2 {
    struct DemoList: View {
        @State private var items: [Item] = (0..<5).map { Item(title: "Item #\($0)") }
        @State private var editMode = EditMode.inactive

        var body: some View {
            NavigationView {
                List {
                    ForEach(items) { item in
                        Text(item.title)
                    }
                }
                .navigationBarTitle("List")
                .navigationBarItems(leading: EditButton())
                .environment(\.editMode, $editMode)
            }
        }
    }
}

enum Step3 {
    struct DemoList: View {
        @State private var items: [Item] = (0..<5).map { Item(title: "Item #\($0)") }
        @State private var editMode = EditMode.inactive
        
        var body: some View {
            NavigationView {
                List {
                    ForEach(items) { item in
                        Text(item.title)
                    }
                }
                .navigationBarTitle("List")
                .navigationBarItems(leading: EditButton(), trailing: addButton)
                .environment(\.editMode, $editMode)
            }
        }
        
        private var addButton: some View {
            switch editMode {
            case .inactive:
                return AnyView(Button(action: onAdd) { Image(systemName: "plus") })
            default:
                return AnyView(EmptyView())
            }
        }
        
        func onAdd() {}
    }
}
