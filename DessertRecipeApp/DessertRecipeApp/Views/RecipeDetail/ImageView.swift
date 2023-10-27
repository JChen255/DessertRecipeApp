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
                .frame(width: 420, height: 290)
        } placeholder: {
            Rectangle()
                .foregroundColor(.white)
                .frame(width: 420, height: 290)
        }
    }
}

#Preview {
    ImageView()
}
