//
//  RecipeDetailViewModel.swift
//  DessertRecipeApp
//

import Foundation

class RecipeDetailViewModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    var recipe: Recipe?{
        guard let firstRecipe = recipes.first else {return nil}
        return firstRecipe
    }
    
    var ingredients: [Ingredient] {
        var ingredientList: [String] = []
        var measurementList: [String] = []
        
        if let recipe = recipes.first {
            let mirror = Mirror(reflecting: recipe)
            for i in 1...20 {
                let ingredientKey = "ingredient\(i)"
                let measureKey = "measure\(i)"
                
                for child in mirror.children {
                    if child.label == ingredientKey {
                        if let ingredientName = child.value as? String, !ingredientName.isEmpty {
                            ingredientList.append(ingredientName)
                        }
                    }
                    if child.label == measureKey {
                        if let measurement = child.value as? String, !measurement.isEmpty {
                            measurementList.append(measurement)
                        }
                    }
                }
            }
        }
        
        var ingredients: [Ingredient] = []
        for j in 0..<ingredientList.count { // Use 0-based index to access arrays
            let ingredient = Ingredient(name: ingredientList[j], measurement: measurementList[j])
            ingredients.append(ingredient)
        }
        
        return ingredients
    }

}
