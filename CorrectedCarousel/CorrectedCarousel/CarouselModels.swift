//
//  CarouselModels.swift
//  xref-ios
//
//  Created by Maddali, Ramesh on 10/9/22.
//

import SwiftUI
import Combine
import Foundation


struct Card: Identifiable, Hashable
{
  var id:     Int
  let newImage: UIImage
  var title: String = ""
}

class ReviewImage {
  var position: Int = 0
  var type: BinContent = .label
  var image: UIImage = UIImage()
  
  convenience init(position: Int = 0, type: BinContent = .label, image: UIImage = UIImage()) {
    self.init()
    self.position = position
    self.type = type
    self.image = image
  }
}
public class UIStateModel: ObservableObject {
  @Published var screenDrag: Float = 0.0
  @Published var activeCard: Int = 0
}

final public class CarouselStateModel: ObservableObject{
  // MARK: - Properties--we have a UIStateModel class to combat the error on line 57
  @Published private(set) var stateModel: UIStateModel = UIStateModel()
  @Published private(set) var activeCard: Int = 0
  private var cancellables: [AnyCancellable] = []
  
  // MARK: - Lifecycle to see if the card has finally moved
  init() {
    self.stateModel.$activeCard.sink { completion in
      switch completion {
      case let .failure(error):
        print("finished with error: ", error.localizedDescription)
      case .finished:
        print("finished")
      }
    } receiveValue: { [weak self] activeCard in
      self?.someCoolMethodHere(for: activeCard)
    }.store(in: &cancellables)
  }
  
  // MARK: - Helpers to see if the label and card id are matching
  private func someCoolMethodHere(for activeCard: Int) {
    print("someCoolMethodHere: activeCard received: ", activeCard)
    self.activeCard = activeCard
  }
}
