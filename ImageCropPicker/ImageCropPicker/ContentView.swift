//
//  ContentView.swift
//  ImageCropPicker
//
//  Created by Gunnar Beck on 12/6/22.
//

import SwiftUI
   
   struct ContentView: View {
       
       @State private var isShowingPhotoSelectionSheet = false
       @State private var finalImage: UIImage?
       @State private var inputImage: UIImage?
       
       var body: some View {
           
           VStack {
               
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
           }
           .statusBar(hidden: isShowingPhotoSelectionSheet)
           .fullScreenCover(isPresented: $isShowingPhotoSelectionSheet, onDismiss: loadImage) {
               ImageMoveAndScaleSheet(croppedImage: $finalImage)
           }
       }
       
       func loadImage() {
           guard let inputImage = inputImage else { return }
           finalImage = inputImage
       }
   }
   
   struct ContentView_Previews: PreviewProvider {
       static var previews: some View {
           ContentView()
       }
   }
