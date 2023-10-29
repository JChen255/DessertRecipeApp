//
//  IngredientView.swift
//  DessertRecipeApp
//


import SwiftUI

struct IngredientView: View {
    var ingredients = [Ingredient]()
    var body: some View {
        // Use a list to display all the ingredients of the recipe
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
