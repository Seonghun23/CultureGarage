//
//  Network.swift
//  TMDB
//
//  Created by Seonghun Kim on 2020/01/05.
//  Copyright © 2020 Seonghun Kim. All rights reserved.
//

import Foundation

public final struct MovieAPI {
    private enum Endpoint {
        static let search = "/search/movie"
    }
    
    private enum HttpMethod {
        static let get = "GET"
    }
    
    public enum RequestType {
        case search(String)
    }
    
    public init() {}
    
    public func getRequest(for type: RequestType) -> URLRequest? {
        switch type {
        case let .search(title):
            return makeSearchRequest(with: title)
        }
    }
    
    private func makeSearchRequest(with title: String) -> URLRequest? {
        guard !title.isEmpty else { return nil }
        
        let urlString = Url.api + Endpoint.search
        guard let url = URL(string: urlString) else {
            assert(false, urlString + "is not URL")
            return nil
        }
        
        var request = URLRequest(url: url)
        
        let keyQueryItem = URLQueryItem(name: "api_key", value: Key.v3)
        let titleQueryItem = URLQueryItem(name: "query", value: title)
        
        guard let urlComponents = NSURLComponents(url: url, resolvingAgainstBaseURL: false) else {
            assert(false, "Failure create NSURLComponents from \(url)")
            return nil
        }
        
        urlComponents.queryItems = [keyQueryItem, titleQueryItem]
        
        guard let urlComponentsURL = urlComponents.url else {
            assert(false, "Failure load URL from \(urlComponents)")
            return nil
        }
        
        #if DEBUG
        print(urlComponentsURL)
        #endif
        
        request.url = urlComponentsURL
        request.httpMethod = HttpMethod.get
        
        return request
    }
}
