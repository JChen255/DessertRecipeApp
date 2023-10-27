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
            Button{
                showInstruction.toggle()
            }label: {
                Text("Ingredients")
                    .font(.title3)
                    .bold()
                    .foregroundColor(showInstruction ? .gray : .orange)
                    .padding(.horizontal, 30)
            }
        }
    }
}

#Preview {
    BodyView(showInstruction: .constant(false))
}
