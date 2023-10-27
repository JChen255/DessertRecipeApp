//
//  APIService.swift
//  DessertRecipeApp
//

import Foundation

class APIServices{
    static func getDessert() async throws -> Desserts{
        let endpoint = "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        guard let url = URL(string: endpoint) else {
            throw AppError.invalidUrl
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw AppError.invalidResponse
        }
        do{
            let decoder = JSONDecoder()
            return try decoder.decode(Desserts.self, from: data)
        }catch{
            throw AppError.invalidData
        }
    }
    
    static func getRecipe(_ id: String) async throws -> Recipes{
        let endpoint = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)"
        guard let url = URL(string: endpoint) else {
            throw AppError.invalidUrl
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw AppError.invalidResponse
        }
        do{
            let decoder = JSONDecoder()
            return try decoder.decode(Recipes.self, from: data)
        }catch{
            throw AppError.invalidData
        }
    }
}

enum AppError: Error{
    case invalidUrl
    case invalidResponse
    case invalidData
}
