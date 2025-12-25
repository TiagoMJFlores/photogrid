//
//  Resolver+PhotoFeed.swift
//  PhotoGrid
//
//  Created by Tiago Flores on 25/12/2025.
//

import Resolver

extension Resolver {
    static func registerPhotoFeedModule() {
        
        register { PhotoService() as PhotoServiceProtocol }
            .scope(.application)

        register { PhotoRepository() as PhotoRepositoryProtocol }
             
        register { FetchPhotosUseCase() as FetchPhotosUseCaseProtocol}

        register { PhotoFeedInteractor() as PhotoFeedInteractorProtocol}

        register { PhotoFeedViewModel()  }
        
        register { ThumbnailURLFactory() as ThumbnailURLFactoryProtocol}
        
    }
    
}
