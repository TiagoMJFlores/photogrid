//
//  PhotoGridInteractor.swift
//  PhotoGrid
//
//  Created by Tiago Flores on 24/12/2025.
//


protocol PhotoFeedInteractorProtocol {
    func fetchPhotos() async throws -> [PhotoFeedEntity]
}
 
struct PhotoFeedInteractor {
    
    // Current use case for fetching photos.
    // Can have other use cases added in the future (e.g., like, favorite, share)
    private var fetchPhotosUseCase: FetchPhotosUseCaseProtocol
    
    init(fetchPhotosUseCase: FetchPhotosUseCaseProtocol) {
        self.fetchPhotosUseCase = fetchPhotosUseCase
    }
    func fetchPhotos() async throws -> [PhotoFeedEntity] {
        try await fetchPhotosUseCase.execute()
    }
}
