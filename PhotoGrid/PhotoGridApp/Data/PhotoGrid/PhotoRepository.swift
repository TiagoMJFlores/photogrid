//
//  PhotoRepository.swift
//  PhotoGrid
//
//  Created by Tiago Flores on 24/12/2025.
//

import Foundation
import Resolver

protocol PhotoRepositoryProtocol {
    func fetchPhotos() async throws -> [PhotoFeedEntity]
}

final class PhotoRepository: PhotoRepositoryProtocol {
 
    @Injected private var service: PhotoServiceProtocol
   
    private var cache: [PhotoFeedEntity]? = nil
   
    func fetchPhotos() async throws -> [PhotoFeedEntity] {
        if let cached = cache {
            return cached
        }
        
        let photos = try await service.fetchPhotos()
        cache = photos
        return photos
    }
}
