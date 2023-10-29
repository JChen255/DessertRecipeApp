//
//  APIService.swift
//  DessertRecipeApp
//

import Foundation

// A class for making asynchronous API requests to retrieve dessert data.
class APIServices{
    
    // Asynchronous function to get dessert data from the API.
    static func getDessert() async throws -> Desserts{
        let endpoint = "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        
        // Check if the URL is valid, and throw an error if it's not.
        guard let url = URL(string: endpoint) else {
            throw AppError.invalidUrl
        }
        
        // Use URLSession to retrieve data from the URL asynchronously.
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Check if the response is valid (status code 200), and throw an error if it's not.
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw AppError.invalidResponse
        }
        do{
            // Decode the received data into a Desserts object using JSONDecoder.
            let decoder = JSONDecoder()
            return try decoder.decode(Desserts.self, from: data)
        }catch{
            throw AppError.invalidData
        }
    }
    
    // Asynchronous function to get a recipe by its ID from the API.
    static func getRecipe(_ id: String) async throws -> Recipes{
        let endpoint = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)"
        
        // Check if the URL is valid, and throw an error if it's not.
        guard let url = URL(string: endpoint) else {
            throw AppError.invalidUrl
        }
        
        // Use URLSession to retrieve data from the URL asynchronously.
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Check if the response is valid (status code 200), and throw an error if it's not.
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw AppError.invalidResponse
        }
        do{
            // Decode the received data into a Recipes object using JSONDecoder.
            let decoder = JSONDecoder()
            return try decoder.decode(Recipes.self, from: data)
        }catch{
            throw AppError.invalidData
        }
    }
}

// Enum to represent various errors that can occur during API requests.
enum AppError: Error{
    case invalidUrl
    case invalidResponse
    case invalidData
}
