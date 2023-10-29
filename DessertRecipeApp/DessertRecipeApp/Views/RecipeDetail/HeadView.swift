//
//  HeadVIew.swift
//  DessertRecipeApp
//


import SwiftUI

struct HeadView: View {
    var recipe: Recipe?
    var body: some View {
        VStack {
            Text(recipe?.name ?? "Recipe")
                .frame(maxWidth: 390, alignment: .center)
                .font(.title)
                .bold()
            HStack{
                TagView(recipe: recipe)
            }
        }
        .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
        .padding(.bottom)
    }
}

#Preview {
    HeadView()
}
