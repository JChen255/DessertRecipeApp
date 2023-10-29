//
//  CardView.swift
//  DessertRecipeApp
//

import SwiftUI

// Resuable view to display each dessert
struct CardView: View {
    var dessert: Dessert?
    var body: some View {
        ZStack{
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 150)
                .cornerRadius(10)
                .foregroundStyle(.white)
                .shadow(radius: 2)
                .padding(.horizontal, 10)
            HStack{
                // Image view that supports cache mechanism
                CachedImage(url: URL(string: dessert?.thumbnailUrl ?? ""))
                Text(dessert?.name ?? "Dessert Name")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(.black)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
                    .lineLimit(2)
                    .dynamicTypeSize(...DynamicTypeSize.accessibility1)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 30)
        }
    }
}


#Preview {
    CardView()
}
