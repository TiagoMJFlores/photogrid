//
//  PhotoFeedViewData.swift
//  PhotoGrid
//
//  Created by Tiago Flores on 24/12/2025.
//

import Foundation

struct PhotoViewData: Identifiable, Hashable {
    let id: String
    let author: String
    let thumbnailURL: String
    let displaySize: CGSize
}
