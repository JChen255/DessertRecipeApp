//
//  SplashScreenView.swift
//  DessertRecipeApp
//


import SwiftUI

// A splash screen displays when launch the app
// Switch to the home view after 2s
struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive{
            HomeView()
        } else {
            ZStack{
                Color.orange
                    .ignoresSafeArea()
                VStack{
                    Image(systemName: "birthday.cake")
                        .font(.system(size: 130))
                        .foregroundStyle(.white)
                        .padding(.all)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.0)) {
                        size = 1.0
                        opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+2.0){
                    isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
