//
//  Bin.swift
//  CorrectedCarousel
//
//  Created by Nelson, Gunnar on 11/13/22.
//


import Foundation
import RealmSwift
import UIKit


class Bin: RealmSwift.Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var _partition: String
    @Persisted var name: String
    @Persisted var level: String
    @Persisted var position: Int
    @Persisted var compartment: String
    @Persisted var height: Double
    @Persisted var width: Double
    @Persisted var xLoc: Int32
    @Persisted var yLoc: Int32
    @Persisted var imageId: ObjectId?
    @Persisted var labelImageId: ObjectId?
    @Persisted var unitId: ObjectId
    @Persisted var productId: ObjectId?
    @Persisted var projectId: ObjectId
    @Persisted var collectionStatus: String
    
    convenience init(
        _partition: String,
        name: String,
        level: String,
        position: Int,
        compartment: String = "",
        xLoc: Int,
        yLoc: Int,
        height: Double,
        width: Double,
        unitId: ObjectId,
        imageId: ObjectId?,
        labelImageId: ObjectId?,
        projectId: ObjectId,
        productId: ObjectId? = nil,
        collectionStatus: String = BinCollectionStatus.notStarted.rawValue
    ) {
        self.init()
        self._partition = _partition
        self.name = name
        self.level = level
        self.position = position
        self.compartment = compartment
        self.xLoc = Int32(xLoc)
        self.yLoc = Int32(yLoc)
        self.height = height
        self.width = width
        self.imageId = imageId
        self.labelImageId = labelImageId
        self.unitId = unitId
        self.productId = productId
        self.projectId = projectId
        self.collectionStatus = collectionStatus
    }
}

