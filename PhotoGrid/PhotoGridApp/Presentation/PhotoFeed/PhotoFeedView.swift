//
//  PhotoGridView.swift
//  PhotoGrid
//
//  Created by Tiago Flores on 24/12/2025.
//

import SwiftUI

struct PhotoFeedView: View {
    
    @StateObject private var viewModel: PhotoFeedViewModel
    
    init() {
    
        let service = PhotoService()
        let repository = PhotoRepository(service: service)
        let useCase = FetchPhotosUseCase(repository: repository)
        let interactor = PhotoFeedInteractor(fetchPhotosUseCase: useCase)
        _viewModel = StateObject(wrappedValue: PhotoFeedViewModel(photoInteractorGrid: interactor))
    }
    
    var body: some View {
        NavigationSplitView {
            VStack {
                PhotoFeedGrid(viewModel: viewModel)
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


