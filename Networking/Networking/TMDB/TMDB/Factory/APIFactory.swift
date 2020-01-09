//
//  APIFactory.swift
//  TMDB
//
//  Created by Seonghun Kim on 2020/01/06.
//  Copyright © 2020 Seonghun Kim. All rights reserved.
//

import Foundation

public struct APIFactory {
    public init() {}
    
    public func makeMovieAPI() -> MovieAPI {
        let urlPath = URL_Path.api
        let key = Key.v3
        
        return MovieAPI(apiKey: key, urlPath: urlPath)
    }

    public func makeImageAPI()-> ImageAPI {
        let urlPath = URL_Path.image
        
        return ImageAPI(urlPath: urlPath)
    }
}
