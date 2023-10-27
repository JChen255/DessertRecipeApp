//
//  HomeViewModel.swift
//  DessertRecipeApp
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var desserts = [Dessert]()
    @Published var keyword: String = ""
    
    var filteredDesserts: [Dessert] {
        guard !keyword.isEmpty else {return desserts}
        return desserts.filter { dessert in
            dessert.name.lowercased().contains(keyword.lowercased())
        }
    }
}
