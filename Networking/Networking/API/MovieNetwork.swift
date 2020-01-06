//
//  MovieNetwork.swift
//  Networking
//
//  Created by Seonghun Kim on 2020/01/05.
//  Copyright © 2020 Seonghun Kim. All rights reserved.
//

import Foundation
import TMDB
import RxSwift

public final class MovieNetwork {
    private let network: Network<Data>
    private let api: MovieRequestable

    init(network: Network<Data>, api: MovieRequestable) {
        self.network = network
        self.api = api
    }

    public func searchMovies(with title: String, at page: Int = 1) -> Observable<[Data]> {
        guard let request = api.searchRequest(for: title, at: page) else {
            return Observable.just([])
        }

        return network.getItems(request)
    }
}
