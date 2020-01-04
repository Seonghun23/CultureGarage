//
//  UIImage+Extension.swift
//  Resources
//
//  Created by Seonghun Kim on 2020/01/04.
//  Copyright © 2020 Seonghun Kim. All rights reserved.
//

import UIKit

extension UIImage {
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: R.bundle, compatibleWith: nil) else {
            assert(false, "\(name) 이미지 로드 실패")
            return UIImage()
        }
        return image
    }
}
