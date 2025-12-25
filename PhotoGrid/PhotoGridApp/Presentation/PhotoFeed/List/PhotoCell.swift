//
//  PhotoCell.swift
//  PhotoGrid
//
//  Created by Tiago Flores on 24/12/2025.
//


import SwiftUI
import Kingfisher

struct PhotoCell: View {
    
    let photo: PhotoViewData
    let isSelected: Bool
    
    var body: some View {
        KFImage(URL(string: photo.thumbnailURL))
            .placeholder {
                ProgressView()
            }
            .resizable()
            .scaledToFit()
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 3)
            )
    }
}
