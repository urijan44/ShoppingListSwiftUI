//
//  Array+extensions.swift
//  ShoppingListSwiftUI
//
//  Created by hoseung Lee on 2022/05/29.
//

import Foundation
extension Array {
  subscript(safe index: Int) -> Element? {
    get {
      guard index >= startIndex, index < endIndex else {
        return nil
      }

      return self[index]
    }

    set {
      guard index >= startIndex, index < endIndex else {
        return
      }

      self[safe: index] = newValue
    }

  }
}
