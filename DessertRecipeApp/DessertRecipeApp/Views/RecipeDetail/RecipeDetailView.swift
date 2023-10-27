//
//  RecipeDetailView.swift
//  DessertRecipeApp
//
//  Created by Janine Chen on 10/26/23.
//

import SwiftUI

struct RecipeDetailView: View {
    @StateObject var recipeDetailViewModel = RecipeDetailViewModel()
    @State private var showInstruction: Bool = true
    @State private var recipeList:[Recipe]?
    var recipeId: String?
    
    var body: some View {
        VStack{
            ImageView(recipe: recipeDetailViewModel.recipes.first)
            HeadView(recipe: recipeDetailViewModel.recipes.first)
            BodyView(showInstruction: $showInstruction)
            
            if(showInstruction){
                InstructionView(recipe:recipeDetailViewModel.recipes.first)
            }else{
                IngredientView(ingredients: recipeDetailViewModel.ingredients)
            }
        }
        .ignoresSafeArea()
        .task {
            do{
                recipeDetailViewModel.recipes = try await APIServices.getRecipe(recipeId ?? "").recipes
            }catch AppError.invalidUrl{
                print("Invalid Url")
            }catch AppError.invalidData{
                print("Invalid Data")
            }catch AppError.invalidResponse{
                print("Invalid Response")
            }catch {
                print("Unexpected Error")
            }
        }
    }
}


#Preview {
    RecipeDetailView()
}
