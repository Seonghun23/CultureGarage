//
//  Network.swift
//  Networking
//
//  Created by Seonghun Kim on 2020/01/05.
//  Copyright © 2020 Seonghun Kim. All rights reserved.
//

import Foundation
//import Alamofire
//import RxAlamofire
import RxSwift

final class Network<T: Decodable> {
    private let endPoint: String
    private let scheduler: ConcurrentDispatchQueueScheduler

    init(_ endPoint: String) {
        self.endPoint = endPoint
        self.scheduler = ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1))
    }
}
