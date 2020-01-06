//
//  Network.swift
//  TMDB
//
//  Created by Seonghun Kim on 2020/01/05.
//  Copyright © 2020 Seonghun Kim. All rights reserved.
//

import Foundation

public struct MovieAPI {
    private enum Endpoint {
        static let search = "/search/movie"
    }
    
    private enum HttpMethod {
        static let get = "GET"
    }
    
    public enum RequestType {
        case search(String, Int)
    }
    
    private let apiKey: String
    private let urlPath: String
    
    public init() {
        self.apiKey = Key.v3
        self.urlPath = URL_Path.api
    }
    
    init(apiKey: String, urlPath: String) {
        self.apiKey = apiKey
        self.urlPath = urlPath
    }
    
    public func getRequest(for type: RequestType) -> URLRequest? {
        switch type {
        case let .search(title, page):
            return makeSearchRequest(with: title, at: page)
        }
    }
    
    private func makeSearchRequest(with title: String, at page: Int) -> URLRequest? {
        guard !title.isEmpty else { return nil }
        
        let urlString = URL_Path.api + Endpoint.search
        guard let url = URL(string: urlString) else {
            assert(false, urlString + "is not URL")
            return nil
        }
        
        var request = URLRequest(url: url)
        
        let keyQueryItem = URLQueryItem(name: "api_key", value: apiKey)
        let titleQueryItem = URLQueryItem(name: "query", value: title)
        let pageQueryItem = URLQueryItem(name: "page", value: "\(page)")
        let adultQueryItem = URLQueryItem(name: "page", value: "true")
        
        guard let urlComponents = NSURLComponents(url: url, resolvingAgainstBaseURL: false) else {
            assert(false, "Failure create NSURLComponents from \(url)")
            return nil
        }
        
        urlComponents.queryItems = [keyQueryItem, titleQueryItem, pageQueryItem, adultQueryItem]
        
        guard let urlComponentsURL = urlComponents.url else {
            assert(false, "Failure load URL from \(urlComponents)")
            return nil
        }
        
        request.url = urlComponentsURL
        request.httpMethod = HttpMethod.get
        
        return request
    }
}
