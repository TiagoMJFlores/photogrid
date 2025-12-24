//
//  PhotoRepository.swift
//  PhotoGrid
//
//  Created by Tiago Flores on 24/12/2025.
//

import Foundation

protocol PhotoRepositoryProtocol {
    func fetchPhotos() async throws -> [PhotoFeedEntity]
}

final class PhotoRepository: PhotoRepositoryProtocol {
 
    private let service: PhotoService
    private var cache: [PhotoFeedEntity]? = nil
    
    init(service: PhotoService) {
        self.service = service
    }
    
    func fetchPhotos() async throws -> [PhotoFeedEntity] {
        if let cached = cache {
            return cached
        }
        
        let photos = try await service.fetchPhotos()
        cache = photos
        return photos
    }
}
