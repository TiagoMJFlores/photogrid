//
//  PhotoGridViewModel.swift
//  PhotoGrid
//
//  Created by Tiago Flores on 24/12/2025.
//

import Foundation
import Resolver

final class PhotoFeedViewModel: ObservableObject {
    
    @Published var photos: [PhotoViewData] = []
    @Published var selectedPhoto: PhotoViewData? = nil
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    @Injected private var photoInteractorGrid: PhotoFeedInteractorProtocol
    @Injected private var thumbnailURLFactory: ThumbnailURLFactoryProtocol
    
    @MainActor
    func loadPhotos() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let models = try await photoInteractorGrid.fetchPhotos()
            photos = models.toViewDataList(thumbnailURLFactory: thumbnailURLFactory)
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
