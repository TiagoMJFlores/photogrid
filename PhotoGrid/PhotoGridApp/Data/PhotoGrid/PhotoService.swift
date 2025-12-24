//
//  PhotoService.swift
//  PhotoGrid
//
//  Created by Tiago Flores on 24/12/2025.
//

import Foundation
struct PhotoService {
    
    func fetchPhotos() async throws -> [PhotoFeedEntity] {
        let urlString = "https://picsum.photos/v2/list?page=1&limit=30"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let apiPhotos = try JSONDecoder().decode([PhotoAPIModel].self, from: data)
        
        return apiPhotos.map { api in
            PhotoFeedEntity(
                id: api.id,
                author: api.author,
                width: api.width,
                height: api.height,
                downloadURL: api.download_url
            )
        }
    }
}

