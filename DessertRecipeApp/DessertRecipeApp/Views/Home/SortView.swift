//
//  SortView.swift
//  DessertRecipeApp
//
//  Created by Janine Chen on 10/26/23.
//

import SwiftUI

struct SortView: View {
    var count: Int = 0
    @Binding var isSorted: Bool
    var body: some View {
        HStack{
            Text("\(count) Items")
                .font(.callout)
                .foregroundColor(.gray)
            Spacer()
            
            Button{
                isSorted.toggle()
            }label: {
                Text("Sort")
                    .font(.callout)
                    .foregroundColor(.gray)
                    .bold()
                Image(systemName: "arrow.up.arrow.down")
                    .foregroundColor(.black)
            }
            
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
        
        Divider()
    }
}

#Preview {
    SortView(isSorted: .constant(false))
}
