//
//  ThumbnailURLFactory.swift
//  PhotoGrid
//
//  Created by Tiago Flores on 25/12/2025.
//
import Foundation

protocol ThumbnailURLFactoryProtocol {
    func makeThumbnailURL(for id: String, size: CGSize) -> String
}

struct ThumbnailURLFactory: ThumbnailURLFactoryProtocol {
    let baseURL: String = "https://picsum.photos/id/"
    
    func makeThumbnailURL(for id: String, size: CGSize = CGSize(width: 150, height: 150)) -> String {
        let width = Int(size.width * 2)
        let height = Int(size.height * 2)
        return "\(baseURL)\(id)/\(width)/\(height)"
    }
}
