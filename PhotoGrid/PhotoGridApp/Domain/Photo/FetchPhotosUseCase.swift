//
//  FetchPhotosUseCase.swift
//  PhotoGrid
//
//  Created by Tiago Flores on 24/12/2025.
//

import Foundation
import Resolver

protocol FetchPhotosUseCaseProtocol {
    func execute() async throws -> [PhotoFeedEntity]
}

struct FetchPhotosUseCase: FetchPhotosUseCaseProtocol {
    
    @Injected var repository: PhotoRepositoryProtocol
    
    func execute() async throws -> [PhotoFeedEntity] {
        try await repository.fetchPhotos().sorted { item1, item2 in
            item1.author > item2.author
        }
    }
}
