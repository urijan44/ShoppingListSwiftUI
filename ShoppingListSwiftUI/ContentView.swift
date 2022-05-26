//
//  ContentView.swift
//  ShoppingListSwiftUI
//
//  Created by hoseung Lee on 2022/05/25.
//

import SwiftUI

struct ContentView: View {
  @State var item: ShoppingItem = ShoppingItem.dummy
  var body: some View {
    ShoppingItemCell(
      content: $item.content,
      isComplte: $item.isCompleted,
      isBookmarked: $item.isBookmarked)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
