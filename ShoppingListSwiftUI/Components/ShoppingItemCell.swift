//
//  ShoppingItemCell.swift
//  ShoppingListSwiftUI
//
//  Created by hoseung Lee on 2022/05/26.
//

import SwiftUI
import Combine

protocol ShoppingItemPresentable {
  var content: String { get set }
  var isCompleted: Bool { get set }
  var isBookmarked: Bool { get set }
}

extension ShoppingItemCell {
  final class ViewModel: ObservableObject {

    @Published var content = ""
    @Published var isCompleted: Bool = false
    @Published var isBookmarked: Bool = false

    init(item: ShoppingItemPresentable) {
      self.content = item.content
      self.isCompleted = item.isCompleted
      self.isBookmarked = item.isBookmarked
    }
  }
}

struct ShoppingItemCell: View {

  @ObservedObject var viewModel: ViewModel
  @State var currentX: CGFloat = 0

  var body: some View {
    ZStack(alignment: .trailing) {
      listBody()
        .offset(x: currentX)
        .gesture(
          drag()
        )
      deleteButton
        .layoutPriority(1)
    }
  }

  @ViewBuilder
  func listBody() -> some View {
    HStack {
      completeButton
      TextField("", text: $viewModel.content)
      bookmarkButton
    }
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 8)
        .stroke(lineWidth: 2)
    )
    .layoutPriority(1000)
    .transition(.move(edge: .bottom).animation(.easeIn(duration: 0.5)))
  }

  var completeButton: some View {
    Button {
      viewModel.isCompleted.toggle()
    } label: {
      Image(systemName: viewModel.isCompleted ? "checkmark.square" : "square")
        .foregroundColor(.black)
    }
  }

  var bookmarkButton: some View {
    Button {
      viewModel.isBookmarked.toggle()
    } label: {
      Image(systemName: viewModel.isBookmarked ? "star.fill" : "star")
        .foregroundColor(.black)
    }
  }

  var deleteButton: some View {
    Rectangle()
      .foregroundColor(.red)
      .overlay(Text("🍗"))
      .frame(width: -currentX)

  }

  init(_ viewModel: ViewModel) {
    self.viewModel = viewModel
  }

  private func drag() -> some Gesture {
    DragGesture()
      .onChanged({ value in
        currentX = value.translation.width
      })
      .onEnded({ value in
        withAnimation {
          currentX = 0
        }
      })
  }
}

struct ShoppingItemCell_Previews: PreviewProvider {
  static var previews: some View {
    ShoppingItemCell(.init(item: ShoppingItem.dummy))
      .previewLayout(.sizeThatFits)
  }
}
