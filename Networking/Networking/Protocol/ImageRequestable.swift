//
//  ImageRequestable.swift
//  Networking
//
//  Created by Seonghun Kim on 2020/01/05.
//  Copyright © 2020 Seonghun Kim. All rights reserved.
//

import Foundation
import TMDB

protocol ImageRequestable {
    func originalSizeRequest(at path: String) -> URLRequest?
    func smallSizeRequest(at path: String) -> URLRequest?
}

extension TMDB.ImageAPI: ImageRequestable {
    func originalSizeRequest(at path: String) -> URLRequest? {
        return getRequest(for: .original(path))
    }
    
    func smallSizeRequest(at path: String) -> URLRequest? {
        return getRequest(for: .small(path))
    }
}
