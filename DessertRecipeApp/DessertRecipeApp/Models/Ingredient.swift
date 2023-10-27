//
//  Ingredient.swift
//  DessertRecipeApp
//

import Foundation

struct Ingredient: Identifiable{
    let id = UUID()
    let name: String
    let measurement: String
}
