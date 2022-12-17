//
//  ContentView.swift
//  ImagePickerShape
//
//  Created by Gunnar Beck on 12/5/22.
//

import SwiftUI

struct ContentView: View {
    @State private var image = UIImage()
    @State private var showSheet = false
    @State var numbers = [1,2,3,4,5,6,7]
    
    @State private var workoutBio: String = ""
    @State private var familyName: String = ""
    
    
    var body: some View {
        ZStack{
            Color.cyan.ignoresSafeArea()
        ScrollView{
            //Picture 1 & Question 1
            VStack(alignment: .leading){
                Text(" A Good First Impression 😉")
                Image(uiImage: self.image)
                    .resizable()
                    .cornerRadius(25)
                    .frame(width: 275, height: 255)
                    .background(Color.white.opacity(0.95))
                    .aspectRatio(contentMode: .fill)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .onTapGesture {
                        showSheet = true
                    }
                Spacer(minLength: 40)
                
                //Question 1
                VStack (alignment: .leading){
                    Text("Why do you workout?")
                TextField(
                    "",
                    text: $workoutBio
                )
                .disableAutocorrection(true)
                }
                .textFieldStyle(.roundedBorder)
                .background(.white)
                .foregroundColor(.black)
            

        }
        .padding(.horizontal, 55)
        .foregroundColor(.white)
        .sheet(isPresented: $showSheet) {
            // Pick an image from the photo library:
            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
        }
    }
}
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

