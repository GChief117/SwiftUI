//
//  ImagePicker.swift
//  ImageCropPicker
//
//  Created by Gunnar Beck on 12/6/22.
//

import SwiftUI

   struct ImagePicker: UIViewControllerRepresentable {
       
       @Environment(\.presentationMode) var presentationMode
       var sourceType: UIImagePickerController.SourceType = .photoLibrary
       @Binding var image: UIImage?
       
       class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
           let parent: ImagePicker
           
           init(_ parent: ImagePicker) {
               self.parent = parent
           }
           
           func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
               if let uiImage = info[.originalImage] as? UIImage {
                   parent.image = uiImage
               }
               parent.presentationMode.wrappedValue.dismiss()
           }
       }

       func makeCoordinator() -> Coordinator {
           Coordinator(self)
       }
       
       func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
           let picker = UIImagePickerController()
           picker.delegate = context.coordinator
           return picker
       }

       func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

       }
   }
