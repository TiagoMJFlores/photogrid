//
//  PhotoFeedViewConverter.swift
//  PhotoGrid
//
//  Created by Tiago Flores on 25/12/2025.
//

import Foundation

extension Array where Element == PhotoFeedEntity {
    func toViewDataList(thumbnailURLFactory: ThumbnailURLFactoryProtocol) -> [PhotoViewData] {
        self.map { $0.toViewData(thumbnailURLFactory: thumbnailURLFactory) }
    }
}

extension PhotoFeedEntity {
    func toViewData(thumbnailURLFactory: ThumbnailURLFactoryProtocol) -> PhotoViewData {
        PhotoViewData(
            id: id,
            author: author,
            thumbnailURL: thumbnailURLFactory.makeThumbnailURL(for: id, size: CGSize(width: 150, height: 150)),
            downloadURL: downloadURL,
            sizeDisplay: "\(width)X\(height)"
        )
    }
}

