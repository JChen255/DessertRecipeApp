//
//  TagView.swift
//  DessertRecipeApp
//

import SwiftUI

// Resuable view to display each recipe's category and area
struct TagView: View {
    var recipe: Recipe?
    var body: some View {
        HStack{
            Text(recipe?.category ?? "category")
                .font(.callout)
                .foregroundColor(.black)
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                .background(.bar)
                .cornerRadius(20)
            Text(recipe?.area ?? "area")
                .font(.callout)
                .foregroundColor(.black)
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                .background(.bar)
                .cornerRadius(20)
        }
        .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
    }
}


#Preview {
    TagView()
}
