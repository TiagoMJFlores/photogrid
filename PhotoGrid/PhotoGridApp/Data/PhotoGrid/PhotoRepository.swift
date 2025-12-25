//
//  PhotoRepository.swift
//  PhotoGrid
//
//  Created by Tiago Flores on 24/12/2025.
//

import Foundation
import Resolver

protocol PhotoRepositoryProtocol {
    func fetchPhotos(page: Int, limit: Int) async throws -> [PhotoFeedEntity]
}

final class PhotoRepository: PhotoRepositoryProtocol {
 
    @Injected private var service: PhotoServiceProtocol
   
    func fetchPhotos(page: Int, limit: Int) async throws -> [PhotoFeedEntity] {
        let photos = try await service.fetchPhotos(page: page, limit: limit)
        return photos
    }
}
