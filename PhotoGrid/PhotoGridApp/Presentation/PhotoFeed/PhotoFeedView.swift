//
//  PhotoGridView.swift
//  PhotoGrid
//
//  Created by Tiago Flores on 24/12/2025.
//

import SwiftUI
import Resolver

struct PhotoFeedView: View {
    
    @StateObject private var viewModel = Resolver.resolve(PhotoFeedViewModel.self)

    var body: some View {
        NavigationSplitView {
            VStack {
                PhotoFeedGrid(viewModel: viewModel) { photo in
                    Task {
                        await viewModel.loadNextPageIfNeeded(currentItem: photo)
                    }
                }
                if viewModel.isLoading {
                    ProgressView()
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                } else {
                    
                }
            }
            .navigationTitle("Fotos")
            .navigationDestination(for: PhotoViewData.self) { photo in
                PhotoFeedDetailView(photo: photo)
                       .onAppear {
                           viewModel.selectedPhoto = photo
                       }
            }
            .task { await viewModel.loadPhotos() }
            
        } detail: {
            if let photo = viewModel.selectedPhoto {
                PhotoFeedDetailView(photo: photo)
            } else {
                Text("Select a photo")
            }
        }
    }
}


#Preview {
    PhotoFeedView()
}


