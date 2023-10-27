//
//  TagView.swift
//  DessertRecipeApp
//
//  Created by Janine Chen on 10/26/23.
//

import SwiftUI

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
