//
//  Requestable.swift
//  Networking
//
//  Created by Seonghun Kim on 2020/01/05.
//  Copyright © 2020 Seonghun Kim. All rights reserved.
//

import Foundation
import TMDB

protocol MovieRequestable {
    func searchRequest(for title: String, at page: Int) -> URLRequest?
}

extension TMDB.MovieAPI: MovieRequestable {
    func searchRequest(for title: String, at page: Int) -> URLRequest? {
        return getRequest(for: .search(title, page))
    }
}


