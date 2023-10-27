//
//  HomeViewModel.swift
//  DessertRecipeApp
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var desserts = [Dessert]()
    @Published var keyword: String = ""
    @Published var isSorted = false
    
    var filteredDesserts: [Dessert] {
        guard !keyword.isEmpty else {return desserts}
        return desserts.filter { dessert in
            dessert.name.lowercased().contains(keyword.lowercased())
        }
    }
    
    var sortedDesserts: [Dessert] {
        if isSorted {
            return filteredDesserts.reversed()
        } else {
            return filteredDesserts
        }
    }
}
