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
