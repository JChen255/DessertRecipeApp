//
//  ContentView.swift
//  DessertRecipeApp
//


import SwiftUI

struct HomeView: View {
    @StateObject var homeViewModel = HomeViewModel()
    @State private var isSorted = false
    
    private var sortedDesserts: [Dessert] {
        if isSorted {
            return homeViewModel.filteredDesserts.reversed()
        } else {
            return homeViewModel.filteredDesserts
        }
    }
    
    var body: some View {
        NavigationStack{
            
            SortView(count: homeViewModel.filteredDesserts.count, isSorted: $isSorted)
            
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack{
                    ForEach(sortedDesserts) { dessert in
                        NavigationLink(destination: RecipeDetailView(recipeId: dessert.id)){
                            CardView(dessert: dessert)
                            }
                        }
                    .padding(.all, 5)
                }
            }
            .navigationTitle("Recipes 🍰")
            .searchable(text: $homeViewModel.keyword, placement: .navigationBarDrawer(displayMode: .always))
        }
        .tint(.orange)
        .task {
            do{
                homeViewModel.desserts = try await APIServices.getDessert().desserts
            }catch AppError.invalidUrl{
                print("Invalid Url")
            }catch AppError.invalidData{
                print("Invalid Data")
            }catch AppError.invalidResponse{
                print("Invalid Response")
            }catch {
                print("Unexpected Error")
            }
        }
    }
}

#Preview {
    HomeView()
}
