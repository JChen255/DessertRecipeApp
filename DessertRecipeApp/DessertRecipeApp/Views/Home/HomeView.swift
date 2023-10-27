//
//  ContentView.swift
//  DessertRecipeApp
//


import SwiftUI

struct HomeView: View {
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack{
            SortView(count: homeViewModel.filteredDesserts.count, isSorted: $homeViewModel.isSorted)
            
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack{
                    ForEach(homeViewModel.sortedDesserts) { dessert in
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
