//
//  RecipeDetailView.swift
//  DessertRecipeApp
//

import SwiftUI

// Resuable view to display detailed info of each dessert recipe
// Contains recipe image, name, category, area, instruction and ingredients list.
struct RecipeDetailView: View {
    @StateObject var recipeDetailViewModel = RecipeDetailViewModel(dataService: APIServices.shared)
    @State private var showInstruction: Bool = true
    var recipeId: String?
    
    var body: some View {
        // Use GeometryReader for more adaptive layout
        GeometryReader{ geo in
            VStack{
                // Display recipe image
                ImageView(recipe: recipeDetailViewModel.recipe)
                    .frame(width: geo.size.width, height: geo.size.height * 0.38)
                
                // Display recipe name, category and area
                HeadView(recipe: recipeDetailViewModel.recipes.first)
                
                // Display reipe instruction or ingredients
                BodyView(showInstruction: $showInstruction)
                
                if(showInstruction){
                    InstructionView(recipe:recipeDetailViewModel.recipes.first)
                }else{
                    IngredientView(ingredients: recipeDetailViewModel.ingredients)
                }
            }
            .ignoresSafeArea()
            .task {
                await recipeDetailViewModel.fetchRecipes(for: recipeId)
            }
        }
    }
}

#Preview {
    RecipeDetailView()
}
