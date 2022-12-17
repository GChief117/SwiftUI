//
//  ContentView.swift
//  List
//
//  Created by Nelson, Gunnar on 12/11/22.
//

import SwiftUI
import MobileCoreServices

struct Item: Identifiable {
    let id = UUID()
    let title: String
}

struct ListView: View {
    @State var items: [Item] = []
    @State private var editMode = EditMode.inactive
    static var count = 0

    var body: some View {
        NavigationView {
          List {
                ForEach(items) { item in
                  Text(item.title)
                    DayView()
                }
                .onDelete(perform: onDelete)
            }
            .navigationBarTitle("Profile")
            .navigationBarItems(leading: EditButton(), trailing: addButton)
            .environment(\.editMode, $editMode)
        }
    }
    
    private var addButton: some View {
        switch editMode {
        case .inactive:
            return AnyView(Button(action: onAdd) { Text("+Add Week") })
        default:
            return AnyView(EmptyView())
        }
    }
    
    private func onDelete(offsets: IndexSet) {
        items.remove(atOffsets: offsets)
        Self.count -= 1
    }
    
    
    
    private func onAdd() {
      items.append(Item(title: "Week \(Self.count + 1)"))
        Self.count += 1
    }
}
