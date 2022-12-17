//
//  ImageManipulation.swift
//  ImageCropPicker
//
//  Created by Gunnar Beck on 12/6/22.
//

import UIKit
import Foundation
import SwiftUI


func imageWithImage(image: UIImage, croppedTo rect: CGRect) -> UIImage {

    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()

    let drawRect = CGRect(x: -rect.origin.x, y: -rect.origin.y,
                          width: image.size.width, height: image.size.height)

    context?.clip(to: CGRect(x: 0, y: 0,
                             width: rect.size.width, height: rect.size.height))

    image.draw(in: drawRect)

    let subImage = UIGraphicsGetImageFromCurrentImageContext()

    UIGraphicsEndImageContext()
    return subImage!
}
