//
//  NetworkProvider.swift
//  Networking
//
//  Created by Seonghun Kim on 2020/01/05.
//  Copyright © 2020 Seonghun Kim. All rights reserved.
//

import Foundation
import Alamofire
import TMDB

final class NetworkProvider {
    public func makeMovieNetwork() -> MovieNetwork {
        let sessionManager = SessionManager.default
        let network = Network<Data>(sessionManager: sessionManager)
        let api = TMDB.MovieAPI()
        
        return MovieNetwork(network: network, api: api)
    }
}
