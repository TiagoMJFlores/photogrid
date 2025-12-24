//
//  PhotoCell.swift
//  PhotoGrid
//
//  Created by Tiago Flores on 24/12/2025.
//


import SwiftUI

struct PhotoCell: View {
    
    let photo: PhotoViewData
    let isSelected: Bool
    
    var body: some View {
        AsyncImage(url: URL(string: photo.thumbnailURL)) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            ProgressView()
        }
        .frame(width: photo.displaySize.width, height: photo.displaySize.height)
        .clipped()
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 3)
        )
    }
}
