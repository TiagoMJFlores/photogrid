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
    
    private var currentPage = 1
    private let limit = 30
    private var hasMorePages = true
        
    @MainActor
    func loadPhotos() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let models = try await photoInteractorGrid.fetchPhotos(page: currentPage, limit: limit)
            
            if models.isEmpty {
                hasMorePages = false
            } else {
                let newPhotos = models.toViewDataList(thumbnailURLFactory: thumbnailURLFactory)
                currentPage += 1
                photos.append(contentsOf: newPhotos)
            }
          
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
    @MainActor
    func loadNextPageIfNeeded(currentItem: PhotoViewData) async {
        guard !isLoading, hasMorePages else { return }
        if currentItem.id == photos.last?.id {
            await loadPhotos()
        }
    }
    
}
