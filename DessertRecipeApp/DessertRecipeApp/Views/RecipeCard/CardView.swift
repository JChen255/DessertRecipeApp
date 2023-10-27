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
            .frame(maxWidth: 330)
            .padding(.all)
            
        }
    }
}


#Preview {
    CardView()
}
