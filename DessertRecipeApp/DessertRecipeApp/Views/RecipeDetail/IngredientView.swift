//
//  IngredientView.swift
//  DessertRecipeApp
//
//  Created by Janine Chen on 10/26/23.
//

import SwiftUI

struct IngredientView: View {
    var ingredients = [Ingredient]()
    var body: some View {
        List{
            ForEach(ingredients) { ingredient in
                HStack{
                    Text(ingredient.name.capitalized)
                        .bold()
                    Spacer()
                    Text(ingredient.measurement)
                }
                .padding(.horizontal)
            }
        }
        .padding(.bottom, 20)
        .dynamicTypeSize(...DynamicTypeSize.accessibility1)
    }
}


#Preview {
    IngredientView()
}
