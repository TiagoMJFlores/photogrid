//
//  DetailView.swift
//  PhotoGrid
//
//  Created by Tiago Flores on 24/12/2025.
//


import SwiftUI
import Kingfisher

struct PhotoFeedDetailView: View {
    
    let photo: PhotoViewData
    
    enum Constants {
        static let navigationTitle = "Photo Detail"
        static let author = "Author:"
        static let id = "ID:"
        static let size = "SIZE:"
        static let url = "URL:"
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                KFImage(URL(string: photo.downloadURL))
                    .fade(duration: 0.3)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text(Constants.author)
                            .font(.body)
                            .fontWeight(.semibold)
                        Text(photo.author)
                            .font(.body)
                    }
                    
                    HStack {
                        Text(Constants.id)
                            .font(.body)
                            .fontWeight(.semibold)
                        Text(photo.id)
                            .font(.body)
                    }
                    
                    HStack(alignment: .top) {
                        Text(Constants.size)
                            .font(.body)
                            .fontWeight(.semibold)
                        Text(photo.sizeDisplay)
                            .font(.body)
                    }
                    
                    HStack(alignment: .top) {
                        Text(Constants.url)
                            .font(.body)
                            .fontWeight(.semibold)
                        Text(photo.author)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer()
            }
            .padding(.top, 0)
        }
        .navigationTitle(Constants.navigationTitle)
        .navigationBarTitleDisplayMode(.large)
    }
}
