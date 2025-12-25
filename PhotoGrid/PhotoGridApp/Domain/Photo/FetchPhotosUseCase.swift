//
//  FetchPhotosUseCase.swift
//  PhotoGrid
//
//  Created by Tiago Flores on 24/12/2025.
//

import Foundation
import Resolver

protocol FetchPhotosUseCaseProtocol {
    func execute(page: Int, limit: Int) async throws -> [PhotoFeedEntity]
}

struct FetchPhotosUseCase: FetchPhotosUseCaseProtocol {
    
    @Injected var repository: PhotoRepositoryProtocol
    
    func execute(page: Int, limit: Int) async throws -> [PhotoFeedEntity] {
        try await repository.fetchPhotos(page: page, limit: limit).sorted { item1, item2 in
            item1.author > item2.author
        }
    }
}
