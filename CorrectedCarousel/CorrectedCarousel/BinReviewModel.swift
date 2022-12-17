//
//  BinReviewViewModel.swift
//  xref-ios
//
//  Created by toheeb on 8/11/22.
//

import SwiftUI
import RealmSwift
import Realm

enum ProductInfo: String {
    case vendorName, customerPartNumber, manufacturerPartNumber
    case productDescription, comments, customLocation
}

@MainActor
class BinReviewViewModel: ObservableObject {
    @Published var vendorName: String = ""
    @Published var manufacturerPartNumber: String = ""
    @Published var customerPartNumber: String = ""
    @Published var productDescription: String = ""
    @Published var comments: String = ""
    @Published var customLocation: String = ""
    @Published var reviewImages: [ReviewImage] = []
    
    var initialProductInfo: [ProductInfo: String] = [:]
    
    
    init(bin: Bin) {
        initialProductInfo = getProductInfoFromStorage(bin: bin)
        populateImages(bin: bin)
    }
    
    public func saveProduct(bin: ObservedRealmObject<Bin>.Wrapper) {
        guard
            let realm = RealmManager.shared.realm,
            let product = productForBin(bin: bin.wrappedValue) else { return }
        do {
            try realm.write {
                product.partNumber = customerPartNumber
                product.productDescription = productDescription
                product.manufacturerPartNumber = manufacturerPartNumber
                product.vendor = vendorName
                product.comments = comments
                product.customLocation = customLocation
            }
            bin.productId.wrappedValue = product._id
            bin.collectionStatus.wrappedValue = BinCollectionStatus.completed.rawValue
        }
        catch let error as NSError {
            print(error)
        }
    }
    
    func populateProductInfo(textLines: [TextLine]) {
        customerPartNumber = initialProductInfo[.customerPartNumber] ?? ""
        comments = initialProductInfo[.comments] ?? ""
        populateProductInfoFromOCROrStorage(textLines: textLines)
    }
    
    private func productForBin(bin: Bin) -> Product? {
        guard
            let realm = RealmManager.shared.realm,
            let productId = bin.productId,
            let product = realm.object(ofType: Product.self, forPrimaryKey: productId) else { return nil }
        return product
    }
    
    private func getProductInfoFromStorage(bin: Bin) -> [ProductInfo: String] {
        var productInfo = [ProductInfo: String]()
        guard let product = productForBin(bin: bin) else { return productInfo }
        productInfo[.vendorName] = product.vendor
        productInfo[.customerPartNumber] = product.partNumber
        productInfo[.manufacturerPartNumber] = product.manufacturerPartNumber
        productInfo[.productDescription] = product.productDescription
        productInfo[.comments] = product.comments
        productInfo[.customLocation] = product.customLocation
        return productInfo
    }
    
    private func populateProductInfoFromOCROrStorage(textLines: [TextLine]) {
        vendorName = textLines.filter { $0.type == .manufacturerName }.map { $0.editedText }.joined(separator: " ")
        vendorName = !vendorName.isEmpty ? vendorName : initialProductInfo[.vendorName] ?? ""
        manufacturerPartNumber = textLines.filter { $0.type == .manufacturerPartNumber }.map { $0.editedText }.joined(separator: " ")
        manufacturerPartNumber = !manufacturerPartNumber.isEmpty ? manufacturerPartNumber : initialProductInfo[.manufacturerPartNumber] ?? ""
        
        productDescription = textLines.filter { $0.type == .productDescription }.map { $0.editedText }.joined(separator: " ")
        productDescription = !productDescription.isEmpty ? productDescription : initialProductInfo[.productDescription] ?? ""
    }
    
    private func populateImages(bin: Bin) {
        var availableImages = [ReviewImage?]()
        BinContent.allCases.reversed().enumerated().forEach {
            if $0.1 != .label,
               let image = getImageFor(bin: bin, content: $0.1) {
                availableImages.append(ReviewImage(type: $0.1, image: image))
            }
        }
        // put label as last
        if let label = getImageFor(bin: bin, content: .label) {
            availableImages.append(ReviewImage(type: .label, image: label))
        }
        
        availableImages.enumerated().forEach { $0.1?.position = $0.0 }
        reviewImages = availableImages.compactMap { $0 }
    }
    
    private func getImageFor(bin: Bin, content: BinContent) -> UIImage? {
        guard let realm = RealmManager.shared.realm else { return nil}
        var image: Image? = nil
        switch content {
        case .label:
            guard let labelImageId = bin.labelImageId else { return nil}
            image = realm.object(ofType: Image.self, forPrimaryKey: labelImageId)
        case .bin:
            guard let imageId = bin.imageId else { return nil}
            image = realm.object(ofType: Image.self, forPrimaryKey: imageId)
        case .product:
            guard let productId = bin.productId else { return nil}
            if let product = realm.object(ofType: Product.self, forPrimaryKey: productId) {
                image = realm.object(ofType: Image.self, forPrimaryKey: product.imageId)
            }
        }
        if let capturedImage = image?.toUIImage() {
            return capturedImage
        }
        return nil
    }
}
