//
//  BinCollectionStatus.swift
//  CorrectedCarousel
//
//  Created by Nelson, Gunnar on 11/13/22.
//


import SwiftUI

enum BinCollectionStatus: String {
    case notStarted, inProgress, completed
}

struct AutoPigeonHoleOverlayBox: View {
    var pigeonHole: PigeonHoleAutoItem
    var transformedFrame: CGRect
    var isInteractable = true
    var binCollectionStatus: BinCollectionStatus = .notStarted
    @Binding var tappedBin: Bin?
    
    private func colorForStatus(status: BinCollectionStatus) -> Color {
        switch status {
        case .notStarted:
            return .red
        case .inProgress:
            return .yellow
        case .completed:
            return .green
        }
    }
    
    private func textForStatus(status: BinCollectionStatus) -> String {
        switch status {
        case .notStarted:
            return ""
        case .inProgress:
            return "🚧"
        case .completed:
            return "✅"
        }
    }
    
    var body: some View {
        ZStack() {
            RoundedRectangle(cornerRadius: 3.5)
                .path(in: transformedFrame)
                .stroke(colorForStatus(status: binCollectionStatus), lineWidth: 2.0)
                .contentShape(Rectangle().path(in: transformedFrame))
            if isInteractable {
                Text(textForStatus(status: binCollectionStatus))
                    .foregroundColor(colorForStatus(status: binCollectionStatus))
                    .position(x: transformedFrame.midX , y: transformedFrame.midY)
                
                Text(pigeonHole.label)
                    .foregroundColor(colorForStatus(status: binCollectionStatus))
                    .position(x: transformedFrame.minX + 10 , y: transformedFrame.minY + 5)
                    .font(.caption)
            }
        }
        .frame(width: transformedFrame.width, height: transformedFrame.height)
        .fixedSize()
        .onTapGesture {
            tappedBin = pigeonHole.realmBin
        }
    }
}
