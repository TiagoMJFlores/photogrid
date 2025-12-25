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
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                KFImage(URL(string: photo.thumbnailURL))
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Author:")
                            .font(.body)
                            .fontWeight(.semibold)
                        Text(photo.author)
                            .font(.body)
                    }
                    
                    HStack {
                        Text("ID:")
                            .font(.body)
                            .fontWeight(.semibold)
                        Text(photo.id)
                            .font(.body)
                    }
                    
                    HStack(alignment: .top) {
                        Text("Size:")
                            .font(.body)
                            .fontWeight(.semibold)
                        Text("\(photo.width)X\(photo.height)")
                            .font(.body)
                    }
                    
                    HStack(alignment: .top) {
                        Text("URL:")
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
        .navigationTitle("Photo Detail")
        .navigationBarTitleDisplayMode(.large)
    }
}
