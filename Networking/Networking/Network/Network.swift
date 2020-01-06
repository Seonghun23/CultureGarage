//
//  Network.swift
//  Networking
//
//  Created by Seonghun Kim on 2020/01/05.
//  Copyright © 2020 Seonghun Kim. All rights reserved.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift

final class Network<T: Decodable> {
    private let scheduler: ConcurrentDispatchQueueScheduler
    private let sessionManager: SessionManager
    
    init(sessionManager: SessionManager) {
        let dispatchQos = DispatchQoS(
            qosClass: DispatchQoS.QoSClass.background,
            relativePriority: 1
        )
        
        self.scheduler = ConcurrentDispatchQueueScheduler(qos: dispatchQos)
        self.sessionManager = sessionManager
    }
    
    func getItems(_ request: URLRequest) -> Observable<[T]> {
        return sessionManager.rx
            .request(urlRequest: request)
            .data()
            .debug()
            .observeOn(scheduler)
            .map({ data -> [T] in
                return try JSONDecoder().decode([T].self, from: data)
            })
    }
}
