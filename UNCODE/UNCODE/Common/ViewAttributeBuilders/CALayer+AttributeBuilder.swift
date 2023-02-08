//
//  CALayer+AttributeBuilder.swift
//  BunchAI
//
//  Created by Domagoj Stankovic on 27.01.2022..
//  Copyright © 2022 Bunch. All rights reserved.
//

import UIKit

extension CALayer {
    @discardableResult
    func backgroundColor(_ backgroundColor: CGColor?) -> Self {
        self.backgroundColor = backgroundColor
        return self
    }

    @discardableResult
    func cornerRadius(_ cornerRadius: CGFloat) -> Self {
        self.cornerRadius = cornerRadius
        return self
    }

    @discardableResult
    func borderWidth(_ borderWidth: CGFloat) -> Self {
        self.borderWidth = borderWidth
        return self
    }

    @discardableResult
    func borderColor(_ borderColor: CGColor?) -> Self {
        self.borderColor = borderColor
        return self
    }

    @discardableResult
    func borderColor(_ borderColor: UIColor?) -> Self {
        self.borderColor = borderColor?.cgColor
        return self
    }

    @discardableResult
    func opacity(_ opacity: Float) -> Self {
        self.opacity = opacity
        return self
    }

    @discardableResult
    func masksToBounds(_ masksToBounds: Bool) -> Self {
        self.masksToBounds = masksToBounds
        return self
    }

    @discardableResult
    func shadowColor(_ shadowColor: CGColor?) -> Self {
        self.shadowColor = shadowColor
        return self
    }

    @discardableResult
    func shadowOpacity(_ shadowOpacity: Float) -> Self {
        self.shadowOpacity = shadowOpacity
        return self
    }

    @discardableResult
    func shadowOffset(_ shadowOffset: CGSize) -> Self {
        self.shadowOffset = shadowOffset
        return self
    }

    @discardableResult
    func shadowRadius(_ shadowRadius: CGFloat) -> Self {
        self.shadowRadius = shadowRadius
        return self
    }

    @discardableResult
    func shadowPath(_ shadowPath: CGPath?) -> Self {
        self.shadowPath = shadowPath
        return self
    }

    @discardableResult
    func shouldRasterize(_ shouldRasterize: Bool) -> Self {
        self.shouldRasterize = shouldRasterize
        return self
    }

    @discardableResult
    func rasterizationScale(_ rasterizationScale: CGFloat) -> Self {
        self.rasterizationScale = rasterizationScale
        return self
    }

    @discardableResult
    func maskedCorners(_ maskedCorners: CACornerMask) -> Self {
        self.maskedCorners = maskedCorners
        return self
    }
}
