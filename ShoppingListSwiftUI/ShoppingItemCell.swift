//
//  ShoppingItemCell.swift
//  ShoppingListSwiftUI
//
//  Created by hoseung Lee on 2022/05/26.
//

import SwiftUI

struct ShoppingItemCell: View {
  @Binding var content: String
  @Binding var isComplte: Bool
  @Binding var isBookmarked: Bool

  var body: some View {
    HStack {
      Button(action: {isComplte.toggle()}, label: {Image(systemName: isComplte ?  "checkmark.square" : "square")}).foregroundColor(.black)
      TextField("", text: $content)
      Button(action: {isBookmarked.toggle()}, label: {Image(systemName: isBookmarked ? "star.fill" : "star")})
        .foregroundColor(.black)
    }
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 8)
        .stroke(lineWidth: 2)
    )
  }
}

struct ShoppingItemCell_Previews: PreviewProvider {
  static var previews: some View {
    ShoppingItemCell(content: .constant("쇼핑 리스트를 입력하세여이게ㅔㅔ게게게게게게ㅔ게"), isComplte: .constant(false), isBookmarked: .constant(false))
      .previewLayout(.sizeThatFits)
  }
}
