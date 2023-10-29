//
//  CachedImage.swift
//  DessertRecipeApp
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
            // Start downloading the image when this view appears.
            await downloadImage()
        }
    }
    
    private func downloadImage() async{
        do{
            // Attempt to fetch the image using the ImageLoader's fetchImage function.
            try await imageLoader.fetchImage(url)
        }catch{
            print(error)
        }
    }
}

#Preview {
    CachedImage(url: URL(string: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg"))
}
