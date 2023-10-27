//
//  HeadVIew.swift
//  DessertRecipeApp
//
//  Created by Janine Chen on 10/26/23.
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
        .padding(.bottom)
    }
}

#Preview {
    HeadView()
}
