//
//  ContentView.swift
//  List
//
//  Created by Nelson, Gunnar on 12/11/22.
//

import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let title: String
}

struct ListView: View {
    @State var items: [Item] = []
    @State private var editMode = EditMode.inactive
    @StateObject var viewModel = ProfileModel()
    @State private var image = UIImage()
    @State private var showSheet = false
    static var count = 0

    var body: some View {
        NavigationView {
          VStack{
            Section {
              HStack {
                Spacer()
                  /*
                  Image(uiImage: self.image)
                      .resizable()
                      //.cornerRadius(25)
                      .frame(maxWidth: 400, maxHeight: 400)
                      //.padding(.bottom, 24)
                      .background(Color.white.opacity(0.95))
                      .aspectRatio(contentMode: .fill)
                      .clipShape(RoundedRectangle(cornerRadius: 25))
                      .onTapGesture {
                          showSheet = true
                      }
                      .sheet(isPresented: $showSheet) {
                          // Pick an image from the photo library:
                          ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                      }
                   */
                  HStack{
                    Section {
                      EditableCircularProfileImage(viewModel: viewModel)
                      TextField("First Name",
                                text: $viewModel.firstName,
                                prompt: Text("@User Name")
                                .foregroundColor(.gray))
                    }
                  }
                
                Spacer()
              }
            }
            
            
            List {
              ForEach(items) { item in
                Text(item.title)
                DayView()
              }
              .onDelete(perform: onDelete)
            }
          }
          
            //.navigationBarTitle("Profile")
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
