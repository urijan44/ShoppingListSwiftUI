//
//  ContentView.swift
//  ShoppingListSwiftUI
//
//  Created by hoseung Lee on 2022/05/25.
//

import SwiftUI

struct ContentView: View {
  @StateObject var viewModel = ViewModel()
  var body: some View {
    NavigationView {
      ScrollView {
        LazyVStack {
          ForEach(viewModel.items, id: \.self) { item in
            ShoppingItemCell(.init(item: item))
          }
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        addToolBarItem
      }
    }
  }

  var addToolBarItem: some ToolbarContent {
    ToolbarItem(placement: .navigationBarTrailing) {
      Button {
        withAnimation {
          viewModel.addItem()
        }
      } label: {
        Image(systemName: "plus")
          .foregroundColor(.black)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
