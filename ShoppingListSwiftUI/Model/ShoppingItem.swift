//
//  ShoppingItem.swift
//  ShoppingListSwiftUI
//
//  Created by hoseung Lee on 2022/05/26.
//

import Foundation

struct ShoppingItem {
  var id = UUID().uuidString
  var content: String
  var isCompleted: Bool
  var isBookmarked: Bool
  var date: Date
}

extension ShoppingItem: Hashable, Identifiable { }

extension ShoppingItem {
  static var dummy: ShoppingItem {
    .init(content: "물건을 잊지 마세요", isCompleted: false, isBookmarked: false, date: Date())
  }
}

extension ShoppingItem: ShoppingItemPresentable { }
