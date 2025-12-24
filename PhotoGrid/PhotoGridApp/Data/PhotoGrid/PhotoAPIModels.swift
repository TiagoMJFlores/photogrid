//
//  ImageGridData.swift
//  PhotoGrid
//
//  Created by Tiago Flores on 24/12/2025.
//

import Foundation

struct PhotoAPIModel: Decodable {
    let id: String
    let author: String
    let width: Int
    let height: Int
    let download_url: String
}

