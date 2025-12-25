//
//  PhotoGridInteractor.swift
//  PhotoGrid
//
//  Created by Tiago Flores on 24/12/2025.
//
import Resolver

protocol PhotoFeedInteractorProtocol {
    func fetchPhotos() async throws -> [PhotoFeedEntity]
}
 
struct PhotoFeedInteractor: PhotoFeedInteractorProtocol {
    
    // Current use case for fetching photos.
    // Can have other use cases added in the future (e.g., like, favorite, share)
    @Injected private var fetchPhotosUseCase: FetchPhotosUseCaseProtocol
    
    func fetchPhotos() async throws -> [PhotoFeedEntity] {
        try await fetchPhotosUseCase.execute()
    }
}
