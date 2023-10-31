//
//  APIService.swift
//  DessertRecipeApp
//

import Foundation

// A class for making asynchronous API requests to retrieve dessert data.
class APIServices{
    
    // Asynchronous generic function to get data from the API.
    static func fetchData<T: Decodable>(from endpoint: String) async throws -> T {
        
        guard let url = URL(string: endpoint) else {
            throw AppError.invalidUrl
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw AppError.invalidResponse
            }
            
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
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
