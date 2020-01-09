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
        static let original = "/original"
        static let small = "/w500"
    }
    
    public enum RequestType {
        case original(String)
        case small(String)
    }
    
    private let urlPath: String
    
    public init(urlPath: String) {
        self.urlPath = urlPath
    }
    
    public func getRequest(for type: RequestType) -> URLRequest? {
        switch type {
        case let .original(path):
            return makeImageRequest(with: path, size: .original)
        case let .small(path):
            return makeImageRequest(with: path, size: .small)
        }
    }
    
    private func makeImageRequest(with path: String, size: Size) -> URLRequest? {
        guard !path.isEmpty else { return nil }
        
        let urlString = urlPath + size.endpoint + path
        guard let url = URL(string: urlString) else {
            assert(false, urlString + "is not URL")
            return nil
        }
        
        return URLRequest(url: url)
    }
}

extension ImageAPI {
    private enum Size {
        case original
        case small
        
        var endpoint: String {
            switch self {
            case .original:
                return Endpoint.original
            case .small:
                return Endpoint.small
            }
        }
    }
}
