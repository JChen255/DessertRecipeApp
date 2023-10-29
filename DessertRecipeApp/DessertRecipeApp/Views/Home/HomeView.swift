//
//  ContentView.swift
//  DessertRecipeApp
//


import SwiftUI

struct HomeView: View {
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack{
            // Display the number of items and sort button
            SortView(count: homeViewModel.filteredDesserts.count, isSorted: $homeViewModel.isSorted)
            
            // Display all the desserts or search results
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
            .accessibility(identifier: "DessertsScrollViewIdentifier")
            .navigationTitle("Recipes 🍰")
            // Search functionality
            .searchable(text: $homeViewModel.keyword, placement: .navigationBarDrawer(displayMode: .always))
        }
        // Dynamic Type
        .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
        .tint(.orange)
        .task {
            await homeViewModel.fetchDesserts()
        }
    }
}

#Preview {
    HomeView()
}
