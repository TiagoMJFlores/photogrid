//
//  PhotoService.swift
//  PhotoGrid
//
//  Created by Tiago Flores on 24/12/2025.
//

import Foundation

protocol PhotoServiceProtocol {
    func fetchPhotos() async throws -> [PhotoFeedEntity]
}

struct PhotoService: PhotoServiceProtocol {
    
    func fetchPhotos() async throws -> [PhotoFeedEntity] {
        let urlString = "https://picsum.photos/v2/list?page=1&limit=30"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let apiPhotos = try JSONDecoder().decode([PhotoAPIModel].self, from: data)
        return apiPhotos.toFeedEntityList()
    }
}

