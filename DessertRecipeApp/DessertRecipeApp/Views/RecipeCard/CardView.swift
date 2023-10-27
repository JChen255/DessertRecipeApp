//
//  CardView.swift
//  DessertRecipeApp
//
//  Created by Janine Chen on 10/26/23.
//

import SwiftUI

struct CardView: View {
    var dessert: Dessert?
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 365, height: 140)
                .cornerRadius(10)
                .foregroundStyle(.white)
                .shadow(radius: 2)
            HStack{
                AsyncImage(url: URL(string: dessert?.thumbnailUrl ?? "")) { image in
                    image
                        .resizable()
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                } placeholder: {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                }
                Text(dessert?.name ?? "")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(.black)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: 330)
            .padding(.all)
        }
    }
}


#Preview {
    CardView()
}
