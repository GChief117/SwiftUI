//
//  PlantData.swift
//  Carousel
//
//  Created by Nelson, Gunnar on 11/11/22.
//

import Foundation
import SwiftUI


struct Card: Decodable, Hashable, Identifiable {
    var id: Int
    var name: String = ""
    var labels: String = ""
}


/*

let items = [
  Card(id: 0, name: "Hey", labels: "Bin Content image"),
  Card(id: 1, name: "Ho", labels: "Product image"),
  Card(id: 2, name: "Lets", labels: "Label image"),
]
*/
/*
struct Planet: Identifiable {
  var id = UUID()
  var labels: [String]
  var mineralAmount: [String]
 //let newImage: UIImage
  
}

let planetsData: [Planet] = [
  
  Planet(labels: ["Bin Content Image", "Product Image", "Label Image"], mineralAmount: ["10K", "20K", "30K"])
]



*/

//structure
/*
 
 The structure needs to have
 
 3 images
 
 3 labels
 
 */




/*
 
 Stuck on:
 
 
 
 1. How to get the labels and the "colors" or "images" to slide together and show together
 2. How to create a single array with the Image and jsut the titles
 
 
 
 
 
 */
