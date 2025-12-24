//
//  PhotoGridViewModel.swift
//  PhotoGrid
//
//  Created by Tiago Flores on 24/12/2025.
//

import Foundation


@MainActor
final class PhotoFeedViewModel: ObservableObject {
    
    @Published var photos: [PhotoViewData] = []
    @Published var selectedPhoto: PhotoViewData? = nil
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    private let thumbnailBaseURL = "https://picsum.photos/id/"
    private let photoInteractorGrid: PhotoFeedInteractor
    
    init(photoInteractorGrid: PhotoFeedInteractor) {
        self.photoInteractorGrid = photoInteractorGrid
    }
    
    func loadPhotos() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let models = try await photoInteractorGrid.fetchPhotos()
            photos = models.map { model in
                PhotoViewData(
                    id: model.id,
                    author: model.author,
                    thumbnailURL: "\(thumbnailBaseURL)\(model.id)/300/300",
                    displaySize: CGSize(width: 150, height: 150)
                )
            }
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
