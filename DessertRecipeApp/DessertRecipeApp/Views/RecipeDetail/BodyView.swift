//
//  BodyView.swift
//  DessertRecipeApp
//
//  Created by Janine Chen on 10/26/23.
//

import SwiftUI

struct BodyView: View {
    @Binding var showInstruction: Bool
    var body: some View {
        HStack{
            Button{
                showInstruction.toggle()
            }label: {
                Text("Instruction")
                    .font(.title3)
                    .bold()
                    .foregroundColor(showInstruction ? .orange : .gray)
                    .padding(.horizontal, 30)
            }
            .scaleEffect(showInstruction ? 1.1 : 0.9)
            Button{
                showInstruction.toggle()
            }label: {
                Text("Ingredients")
                    .font(.title3)
                    .bold()
                    .foregroundColor(showInstruction ? .gray : .orange)
                    .padding(.horizontal, 30)
            }
            .scaleEffect(showInstruction ? 0.9 : 1.1)
        }
        .dynamicTypeSize(...DynamicTypeSize.xxLarge)
    }
}

#Preview {
    BodyView(showInstruction: .constant(false))
}
