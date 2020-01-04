//
//  UIColor+Extension.swift
//  Resources
//
//  Created by Seonghun Kim on 2020/01/04.
//  Copyright © 2020 Seonghun Kim. All rights reserved.
//

import UIKit

extension UIColor {
    static func load(name: String) -> UIColor {
        guard let color = UIColor(named: name, in: R.bundle, compatibleWith: nil) else {
            assert(false, "\(name) 색상 로드 실패")
            return UIColor()
        }
        
        return color
    }
}
