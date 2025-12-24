//
//  PhotoFeedGrid.swift
//  PhotoGrid
//
//  Created by Tiago Flores on 24/12/2025.
//

import SwiftUI

struct PhotoFeedGrid: View {
    
    private let gridItems = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @ObservedObject var viewModel: PhotoFeedViewModel
  
    var body: some View {
        ScrollView {
                                LazyVGrid(columns: gridItems, spacing: 12) {
                                    ForEach(viewModel.photos) { photo in
                                        NavigationLink(value: photo) {
                                            PhotoCell(photo: photo,
                                                      isSelected: viewModel.selectedPhoto == photo)
                                        }
                                    }
                                }
                                .padding()
                            }

    }
}

