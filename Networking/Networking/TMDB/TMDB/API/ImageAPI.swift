//
//  ImageAPI.swift
//  TMDB
//
//  Created by Seonghun Kim on 2020/01/05.
//  Copyright © 2020 Seonghun Kim. All rights reserved.
//

import Foundation

public struct ImageAPI {
    private enum Endpoint {
        static let image = "/t/p/w500"
    }
    
    public enum RequestType {
        case poster(String)
    }
    
    public init() {}
    
    public func getRequest(for type: RequestType) -> URLRequest? {
        switch type {
        case let .poster(path):
            return makePosterRequest(with: path)
        }
    }
    
    private func makePosterRequest(with path: String) -> URLRequest? {
        guard !path.isEmpty else { return nil }
        
        let urlString = URL_Path.image + Endpoint.image + path
        guard let url = URL(string: urlString) else {
            assert(false, urlString + "is not URL")
            return nil
        }
        
        return URLRequest(url: url)
    }
}
