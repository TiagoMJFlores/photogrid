//
//  PhotoAPIModelConverters.swift
//  PhotoGrid
//
//  Created by Tiago Flores on 25/12/2025.
//
import Foundation

extension Array where Element == PhotoAPIModel {
    func toFeedEntityList() -> [PhotoFeedEntity] {
        self.map { api in
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
