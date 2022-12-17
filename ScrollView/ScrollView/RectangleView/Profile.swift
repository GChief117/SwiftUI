/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The main content view of the app.
*/

import SwiftUI
import PhotosUI
import MobileCoreServices


struct Profile: View {
    var body: some View {
        NavigationView {
            ProfileForm()
        }
    }
}
struct Item: Identifiable {
    let id = UUID()
    let title: String
}



struct ProfileForm: View {
    @StateObject var viewModel = ProfileModel()
  
    @State private var items: [Item] = []
    @State private var editMode = EditMode.inactive
    private static var count = 0
    
    var body: some View {
      NavigationView{
        Form {
          Section{
            Text("See and keep track of your progress.")
          }
          Section {
            HStack {
              Spacer()
              EditableRectangleProfileImage(viewModel: viewModel)
              VStack{
                Section {
                  TextField("First Name",
                            text: $viewModel.firstName,
                            prompt: Text("@User Name"))
                  Section {
                    TextField("About Me",
                              text: $viewModel.aboutMe,
                              prompt: Text("About Me"))
                  }
                }
              }
              Spacer()
            }
          }
          .listRowBackground(Color.clear)
          
          
          
        }
        }
        .navigationTitle("Profile")
        .navigationBarItems(leading: EditButton(), trailing: addButton)
        .environment(\.editMode, $editMode)
    }
  
  private var addButton: some View {
      switch editMode {
      case .inactive:
          return AnyView(
            Button(action: onAdd) {Text("+ Add Week")})
      default:
          return AnyView(EmptyView())
      }
  }
  
  private func onDelete(offsets: IndexSet) {
      items.remove(atOffsets: offsets)
  }
  
  private func onMove(source: IndexSet, destination: Int) {
      items.move(fromOffsets: source, toOffset: destination)
  }
  
  private func onInsert(at offset: Int, itemProvider: [NSItemProvider]) {
      for provider in itemProvider {
          if provider.canLoadObject(ofClass: URL.self) {
              _ = provider.loadObject(ofClass: URL.self) { url, error in
                  DispatchQueue.main.async {
                      url.map { self.items.insert(Item(title: $0.absoluteString), at: offset) }
                  }
              }
          }
      }
  }
  
  private func onAdd() {
      items.append(Item(title: "Week \(Self.count + 1)"))
      Self.count += 1
  }
}

