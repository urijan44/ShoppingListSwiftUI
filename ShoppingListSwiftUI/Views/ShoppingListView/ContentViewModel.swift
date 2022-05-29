//
//  ContentViewModel.swift
//  ShoppingListSwiftUI
//
//  Created by hoseung Lee on 2022/05/29.
//

import Foundation
import Combine

extension ContentView {
  final class ViewModel: ObservableObject {
    @Published var items: [ShoppingItem] = [.dummy]

    init() {}

    func addItem() {
      let item = ShoppingItem(content: "", isCompleted: false, isBookmarked: false, date: Date())
      items.append(item)
    }
  }
}
