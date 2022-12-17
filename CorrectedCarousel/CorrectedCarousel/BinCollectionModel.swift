//
//  BinDetectionModel.swift
//  xref-ios
//
//  Created by toheeb on 7/9/22.
//

import UIKit
import RealmSwift

class UnitItem: Identifiable {
    var id = UUID().uuidString
    var label: String = ""
    var coordinate: CGPoint = .zero
    var position: Int = .zero
    var level: String = ""
    var methodOfCreation: UnitCreationMethod = .autoRecognition
    var realmBin: Bin? = nil
}

class PigeonHoleManualItem: UnitItem {
    var row: Int = .zero
    
    init(level: String, row: Int, position: Int) {
        super.init()
        self.methodOfCreation = .manual
        self.level = level
        self.position = position
        self.row = row
    }
    
    convenience init(bin: Bin) {
        // TODO: deal with row, get clarity on overlap between naming convention of pigeonhole vs drawer
        self.init(level: bin.level, row: .zero, position: bin.position)
        self.realmBin = bin
    }
}

class PigeonHoleAutoItem: UnitItem {
    var frame: CGRect = .zero
    var confidence: Float = 0
    var color: UIColor = .green
    var adjustedFrame: CGRect = .zero
    
    init(frame: CGRect = .zero, confidence: Float = .zero, label: String = "") {
        super.init()
        self.confidence = confidence
        self.frame = frame
        self.label = label
    }
    
    convenience init(adjustedFrame: CGRect, label: String) {
        self.init()
        self.adjustedFrame = adjustedFrame
        self.label = label
    }
    
    convenience init(bin: Bin) {
        self.init()
        self.adjustedFrame = CGRect(x: bin.xLoc.toFloat(), y: bin.yLoc.toFloat(), width: bin.width, height: bin.height)
        self.label = bin.name
        self.realmBin = bin
    }

}


class Calculations {
    var sumOriginY: Int
    var sumHeight: Int
    var meanOriginY: Int
    var meanHeight: Int
    
    init(sumOriginY: Int, sumHeight: Int, meanOriginY: Int, meanHeight: Int) {
        self.sumOriginY = sumOriginY
        self.sumHeight = sumHeight
        self.meanOriginY = meanOriginY
        self.meanHeight = meanHeight
    }
}
