//
//  ImageView.swift
//  DessertRecipeApp
//


import SwiftUI

struct ImageView: View {
    var recipe: Recipe?
    
    var body: some View {
        AsyncImage(url: URL(string: recipe?.thumbnailUrl ?? "")) { image in
            image
                .resizable()
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    ImageView()
}
