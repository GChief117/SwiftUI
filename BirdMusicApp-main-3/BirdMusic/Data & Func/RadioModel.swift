//
//  RadioModel.swift
//  AppleMusic
//
//  Created by Gunnar Beck on 9/14/22.
//
import Foundation
import SwiftUI



/*
 
 Here we have our given structure of data, which is treated as an array
 Given we have local items stored within our project
 Such as the
 
 */
struct RadioModel: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var location: String
    var imageSqr: String
    var soundGarden: String
    


    static var covers: [RadioModel] = [RadioModel(title: "Red-billed",
                                                  location: "Tianlin Community, Shanghai",
                                                  imageSqr: "book1",
                                                  soundGarden: "Red-billed"),
                                       RadioModel(title: "Plume-toed Swiftlet",
                                                  location: "Rafflesia Centre, Crocker Range, Sabah, Borneo",
                                                  imageSqr: "book2",
                                                  soundGarden: "Plume-toed Swiftlet"),
                                       RadioModel(title: "Eurasian Magpie - Pica",
                                                  location: "Jyrgalan",
                                                  imageSqr: "book3",
                                                  soundGarden: "Eurasian Magpie - Pica"),
                                       ]
}

struct RadioViewModel: Identifiable {
   var id = UUID()
   var bird: RadioModel

   var title: String {
      return bird.title.capitalized
   }
   var location: String {
      return bird.location.capitalized
   }
   var cover: String {
      return bird.imageSqr
   }
   var soundGarden: String {
      return String(bird.soundGarden)
   }
}

