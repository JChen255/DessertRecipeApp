//
//  APIService.swift
//  DessertRecipeApp
//

import Foundation

protocol DataService{
    func fetchData<T: Decodable>(from endpoint: String) async throws -> T
}

// A class for making asynchronous API requests to retrieve dessert data.
class APIServices: DataService{
    static let shared = APIServices()
    
    private init() { }
    
    // Asynchronous generic function to get data from the API.
    func fetchData<T: Decodable>(from endpoint: String) async throws -> T {
        
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

class MockAPIService: DataService{
    static let shared = MockAPIService()
    
    static let mockDesserts: Desserts = {
        Desserts(desserts: [Dessert(name: "Chocolate Caramel Crispy", thumbnailUrl: "https://www.themealdb.com/images/media/meals/1550442508.jpg", id: "52966"),Dessert(name: "Chocolate Gateau", thumbnailUrl: "https://www.themealdb.com/images/media/meals/tqtywx1468317395.jpg", id: "52776")])
    }()
    
    static let mockRecipes: Recipes = {
        Recipes(recipes: [Recipe(name: "Test Recipe",
                                 category: "Test Category",
                                 area: "Test Area",
                                 instruction: "Test Instruction",
                                 thumbnailUrl: "Test Thumbnail",
                                 ingredient1: "Plain Flour",
                                 ingredient2: "Caster Sugar",
                                 ingredient3: "Butter",
                                 ingredient4: "",
                                 ingredient5: "",
                                 ingredient6: "",
                                 ingredient7: "",
                                 ingredient8: "",
                                 ingredient9: "",
                                 ingredient10: "",
                                 ingredient11: "",
                                 ingredient12: nil,
                                 ingredient13: "",
                                 ingredient14: "",
                                 ingredient15: nil,
                                 ingredient16: nil,
                                 ingredient17: nil,
                                 ingredient18: "",
                                 ingredient19: nil,
                                 ingredient20: "",
                                 measure1: "120g",
                                 measure2: "60g",
                                 measure3: "30g",
                                 measure4: "",
                                 measure5: "",
                                 measure6: "",
                                 measure7: "",
                                 measure8: "",
                                 measure9: nil,
                                 measure10: "",
                                 measure11: "",
                                 measure12: nil,
                                 measure13: "",
                                 measure14: "",
                                 measure15: nil,
                                 measure16: "",
                                 measure17: nil,
                                 measure18: "",
                                 measure19: "",
                                 measure20: nil
                                 )])
    }()
    
    func fetchData<T>(from endpoint: String) async throws -> T where T: Decodable {
        if endpoint.contains("filter.php?c=Dessert"){
            return MockAPIService.mockDesserts as! T
        }else if endpoint.contains("lookup.php?i="){
            return MockAPIService.mockRecipes as! T
        }else{
            throw AppError.invalidUrl
        }
    }
}

// Enum to represent various errors that can occur during API requests.
enum AppError: Error{
    case invalidUrl
    case invalidResponse
    case invalidData
}


