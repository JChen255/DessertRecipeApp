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
    var recipeId: String?
    
    var body: some View {
        GeometryReader{ geo in
            VStack{
                ImageView(recipe: recipeDetailViewModel.recipe)
                    .frame(width: geo.size.width, height: geo.size.height * 0.38)
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
}


#Preview {
    RecipeDetailView()
}
