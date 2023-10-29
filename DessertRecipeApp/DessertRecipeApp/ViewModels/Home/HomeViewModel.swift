//
//  HomeViewModel.swift
//  DessertRecipeApp
//

import Foundation

// HomeViewModel: to facilitate communication between home views and dessert model

@MainActor
class HomeViewModel: ObservableObject {
    @Published var desserts = [Dessert]()
    @Published var keyword: String = ""
    @Published var isSorted = false
    
    // Computed property to get filtered desserts based on the keyword.
    var filteredDesserts: [Dessert] {
        guard !keyword.isEmpty else {return desserts}
        return desserts.filter { dessert in
            dessert.name.lowercased().contains(keyword.lowercased())
        }
    }
    
    // Computed property to get alphabetically sorted desserts.
    var sortedDesserts: [Dessert] {
        if isSorted {
            return filteredDesserts.reversed()
        } else {
            return filteredDesserts
        }
    }
    
    // Function to fetch desserts asynchronously from an API.
    func fetchDesserts() async {
        do {
            let desserts = try await APIServices.getDessert().desserts
            self.desserts = desserts
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
