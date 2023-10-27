//
//  CachedImage.swift
//  DessertRecipeApp
//
//  Created by Janine Chen on 10/27/23.
//
import Foundation
import SwiftUI

struct CachedImage: View {
    @StateObject private var imageLoader = ImageLoader()
    let url: URL?
    
    var body: some View {
        VStack{
            if let uiImage = imageLoader.uiImage{
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 120, height: 120)
                    .cornerRadius(10)
            }else{
                ProgressView()
            }
        }
        .task {
            await downloadImage()
        }
    }
    
    private func downloadImage() async{
        do{
            try await imageLoader.fetchImage(url)
        }catch{
            print(error)
        }
    }
}

#Preview {
    CachedImage(url: URL(string: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg"))
}
