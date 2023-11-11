//
//  RecipeDetailViewModel.swift
//  DessertRecipeApp
//

import Foundation

// RecipeDetailViewModel: to facilitate communication
// between recipedetail views and recipe and ingredient models

class RecipeDetailViewModel: ObservableObject {
    @Published var recipes = [Recipe]()
    var dataService: DataService
    init(dataService: DataService){
        self.dataService = dataService
    }
    
    // Return the first recipe in the 'recipes' array, if it exists.
    var recipe: Recipe?{
        guard let firstRecipe = recipes.first else {return nil}
        return firstRecipe
    }
    
    // Return a list of ingredients (combining corresponding ingredient and measurement)
    var ingredients: [Ingredient] {
        var ingredientList: [String] = []
        var measurementList: [String] = []
        
        if let recipe = recipes.first {
            // Mirror is used to inspect the properties of the 'recipe' object.
            let mirror = Mirror(reflecting: recipe)
            for i in 1...20 {
                let ingredientKey = "ingredient\(i)"
                let measureKey = "measure\(i)"
                
                for child in mirror.children {
                    // Check if the current property in 'recipe' matches the ingredient or measurement key.
                    if child.label == ingredientKey {
                        // If it's a non-empty string, add it to the 'ingredientList'.
                        if let ingredientName = child.value as? String, !ingredientName.isEmpty {
                            ingredientList.append(ingredientName)
                        }
                    }
                    if child.label == measureKey {
                        // If it's a non-empty string, add it to the 'measurementList'.
                        if let measurement = child.value as? String, !measurement.isEmpty {
                            measurementList.append(measurement)
                        }
                    }
                }
            }
        }
        
        var ingredients: [Ingredient] = []
        for j in 0..<ingredientList.count {
            // Create 'Ingredient' objects by pairing ingredient names and measurements.
            let ingredient = Ingredient(name: ingredientList[j], measurement: measurementList[j])
            ingredients.append(ingredient)
        }
        
        return ingredients
    }
    
    // Attempt to fetch recipe data from an API service based on the provided recipe ID.
    func fetchRecipes(for recipeId: String?) async {
        do {
            let recipeData: Recipes = try await dataService.fetchData(from: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(recipeId ?? "")")
            DispatchQueue.main.async {
                self.recipes = recipeData.recipes
                print("self.recipes", self.recipes)
            }
        } catch AppError.invalidUrl {
            print("Invalid Url")
        } catch AppError.invalidData {
            print("Invalid Data")
        } catch AppError.invalidResponse {
            print("Invalid Response")
        } catch {
            print("Unexpected Error")
        }
    }
}
