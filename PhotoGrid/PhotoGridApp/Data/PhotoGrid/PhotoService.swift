//
//  PhotoService.swift
//  PhotoGrid
//
//  Created by Tiago Flores on 24/12/2025.
//

import Foundation

protocol PhotoServiceProtocol {
    func fetchPhotos(page: Int, limit: Int) async throws -> [PhotoFeedEntity]
}

struct PhotoService: PhotoServiceProtocol {
    
    enum Constants {
        static let baseURL = "https://picsum.photos/v2/list"
        static let page = "page"
        static let limit = "limit"
    }
    
    func fetchPhotos(page: Int, limit: Int) async throws -> [PhotoFeedEntity] {
        var components = URLComponents(string: Constants.baseURL)
        components?.queryItems = [
            URLQueryItem(name: Constants.page, value: String(page)),
            URLQueryItem(name: Constants.limit, value: String(limit))
        ]

        guard let url = components?.url else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let apiPhotos = try JSONDecoder().decode([PhotoAPIModel].self, from: data)
        return apiPhotos.toFeedEntityList()
    }
}

