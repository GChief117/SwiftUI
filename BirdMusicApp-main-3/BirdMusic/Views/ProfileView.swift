//
//  ProfileView.swift
//  BirdMusic
//
//  Created by Gunnar Beck on 12/3/22.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    
    @State private var image = UIImage()
    @State private var showSheet = false
    
    @State private var isShowingPhotoSelectionSheet = false
    @State private var finalImage: UIImage?
    @State private var inputImage: UIImage?

    
    var body: some View {
        NavigationView{
        VStack{
            HStack(alignment: .center) {
                
                if finalImage != nil {
                    Image(uiImage: finalImage!)
                        .resizable()
                        .frame(width: 125, height: 125)
                        .scaledToFill()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                        .onTapGesture {
                            self.isShowingPhotoSelectionSheet = true
                        }
                } else {
                    Color.yellow.opacity(0.2)
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 125, height: 125)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .onTapGesture {
                            self.isShowingPhotoSelectionSheet = true
                        }
                }
                Text("User name")
                    .font(.system(size: 25))
                Spacer()
                
            }
            .padding(.horizontal, 20)
            .fullScreenCover(isPresented: $isShowingPhotoSelectionSheet, onDismiss: loadImage) {
                ImageMoveAndScaleSheet(croppedImage: $finalImage)
            }
            /*
            .sheet(isPresented: $showSheet) {
                // Pick an image from the photo library:
                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
            }
             */
            
            ScrollView{
                VStack(alignment: .leading){
                    Text("Week")
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0 ..< 6) { item in
                            VStack{
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 145, height: 145)
                            Text("Day")
                            }
                        }
                    }
                }
                   // .padding()
                }
                .padding()
                
                Button(action: {
                    
                }) {
                    Text("+ Add Week +")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .medium))
                }.frame(width: 175)
                    .padding(.vertical, 10)
                    .background(Color.blue.opacity(2.0))
                    .cornerRadius(10)
                    .padding(.horizontal, 0)
                
            }
        }
            Spacer()
        }.navigationBarTitle("Profile")
    }


func loadImage() {
    guard let inputImage = inputImage else { return }
    finalImage = inputImage
}
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

