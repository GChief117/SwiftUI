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



struct ProfileForm: View {
  @State var items: [Item] = []
  @State private var editMode = EditMode.inactive
  @StateObject var viewModel = ProfileModel()
  static var count = 0

  var body: some View {
      NavigationView {
        VStack{
          Section {
            HStack {
              Spacer()
              EditableCircularProfileImage(viewModel: viewModel)
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
          
          
          List {
            ForEach(items) { item in
              Text(item.title)
              DayView()
            }
            .onDelete(perform: onDelete)
          }
        }
      }
      //.navigationBarTitle("Profile")
      .navigationBarItems(leading: EditButton(), trailing: addButton)
      .environment(\.editMode, $editMode)
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
