//
//  DetailView.swift
//  PhotoGrid
//
//  Created by Tiago Flores on 24/12/2025.
//


import SwiftUI

struct PhotoFeedDetailView: View {
    
    let photo: PhotoViewData
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                AsyncImage(url: URL(string: photo.thumbnailURL)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                
                Text("Autor: \(photo.author)")
                    .font(.headline)
            }
            .padding()
        }
        .navigationTitle("Detalhe")
    }
}
