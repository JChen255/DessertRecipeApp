//
//  HomeViewModel.swift
//  DessertRecipeApp
//

import Foundation

@MainActor
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
