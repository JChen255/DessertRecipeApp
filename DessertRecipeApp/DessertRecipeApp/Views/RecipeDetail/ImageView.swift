//
//  ImageView.swift
//  DessertRecipeApp
//
//  Created by Janine Chen on 10/26/23.
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
