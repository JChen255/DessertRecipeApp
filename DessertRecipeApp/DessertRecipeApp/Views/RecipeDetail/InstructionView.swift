//
//  InstructionView.swift
//  DessertRecipeApp
//
//  Created by Janine Chen on 10/26/23.
//

import SwiftUI

struct InstructionView: View {
    var recipe: Recipe?
    var body: some View {
        Divider()
        ScrollView(showsIndicators: false){
            Text(recipe?.instruction ?? "Instruction detail")
                .padding(.all, 30)
        }
        .dynamicTypeSize(...DynamicTypeSize.accessibility3)
    }
}
#Preview {
    InstructionView()
}
