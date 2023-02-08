//
//  UIStackView+AttributeBuilder.swift
//  BunchAI
//
//  Created by Domagoj Stankovic on 27.01.2022..
//  Copyright © 2022 Bunch. All rights reserved.
//

import UIKit

extension UIStackView {
    @discardableResult
    func axis(_ axis: NSLayoutConstraint.Axis) -> Self {
        self.axis = axis
        return self
    }

    @discardableResult
    func alignment(_ alignment: UIStackView.Alignment) -> Self {
        self.alignment = alignment
        return self
    }

    @discardableResult
    func distribution(_ distribution: UIStackView.Distribution) -> Self {
        self.distribution = distribution
        return self
    }

    @discardableResult
    func spacing(_ spacing: CGFloat) -> Self {
        self.spacing = spacing
        return self
    }

    @discardableResult
    func addArrangedSubviews(_ views: UIView...) -> Self {
        for view in views {
            addArrangedSubview(view)
        }
        return self
    }

    @discardableResult
    func addArrangedSubviews(_ views: [UIView]) -> Self {
        for view in views {
            addArrangedSubview(view)
        }
        return self
    }

    @discardableResult
    func removeArrangedSubviews() -> Self {
        self.arrangedSubviews.forEach { $0.removeFromSuperview() }
        return self
    }

    @discardableResult
    func customSpacing(_ spacing: CGFloat, after arrangedSubview: UIView) -> Self {
        self.setCustomSpacing(spacing, after: arrangedSubview)
        return self
    }
}
