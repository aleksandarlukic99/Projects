//
//  UIImageView+AttributeBuilder.swift
//  BunchAI
//
//  Created by Domagoj Stankovic on 27.01.2022..
//  Copyright © 2022 Bunch. All rights reserved.
//

import UIKit

extension UIImageView {
    @discardableResult
    func image(_ image: UIImage?) -> Self {
        self.image = image
        return self
    }

    @discardableResult
    func imageHideIfNil(_ image: UIImage?) -> Self {
        self.image = image
        self.isHidden = image == nil
        return self
    }
}
