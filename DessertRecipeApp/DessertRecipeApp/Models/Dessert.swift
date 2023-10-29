//
//  Dessert.swift
//  DessertRecipeApp
//


struct Dessert: Codable, Identifiable, Equatable{
    let name: String
    let thumbnailUrl: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case thumbnailUrl = "strMealThumb"
        case id = "idMeal"
    }
}

struct Desserts: Codable {
    let desserts: [Dessert]
    
    enum CodingKeys: String, CodingKey {
        case desserts = "meals"
    }
}
