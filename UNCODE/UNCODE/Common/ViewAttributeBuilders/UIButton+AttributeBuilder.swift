//
//  UIButton+AttributeBuilder.swift
//  BunchAI
//
//  Created by Domagoj Stankovic on 27.01.2022..
//  Copyright © 2022 Bunch. All rights reserved.
//

import UIKit

extension UIButton {
    @discardableResult
    func title(_ title: String?, for state: UIControl.State = .normal) -> Self {
        self.setTitle(title, for: state)
        return self
    }

    @discardableResult
    func titleColor(_ titleColor: UIColor?, for state: UIControl.State = .normal) -> Self {
        self.setTitleColor(titleColor, for: state)
        return self
    }

    @discardableResult
    func image(_ image: UIImage?, for state: UIControl.State = .normal) -> Self {
        self.setImage(image, for: state)
        return self
    }

    @discardableResult
    func backgroundImage(_ backgroundImage: UIImage?, for state: UIControl.State = .normal) -> Self {
        self.setBackgroundImage(backgroundImage, for: .normal)
        return self
    }

    @discardableResult
    func attributedTitle(_ attributedTitle: NSAttributedString?, for state: UIControl.State = .normal) -> Self {
        self.setAttributedTitle(attributedTitle, for: state)
        return self
    }

    @discardableResult
    func isEnabled(_ enabled: Bool) -> Self {
        self.isEnabled = enabled
        return self
    }

    @discardableResult
    func isSelected(_ selected: Bool) -> Self {
        self.isSelected = selected
        return self
    }

    @discardableResult
    func contentEdgeInsets(_ contentEdgeInsets: UIEdgeInsets) -> Self {
        self.contentEdgeInsets = contentEdgeInsets
        return self
    }

    @discardableResult
    func titleEdgeInsets(_ titleEdgeInsets: UIEdgeInsets) -> Self {
        self.titleEdgeInsets = titleEdgeInsets
        return self
    }

    @discardableResult
    func imageEdgeInsets(_ imageEdgeInsets: UIEdgeInsets) -> Self {
        self.imageEdgeInsets = imageEdgeInsets
        return self
    }

    @discardableResult
    func font(_ font: UIFont) -> Self {
        self.titleLabel?.font = font
        return self
    }

    @discardableResult
    func showsTouchWhenHighlighted(_ shows: Bool) -> Self {
        self.showsTouchWhenHighlighted = shows
        return self
    }

    @discardableResult
    func target(_ target: Any?, action: Selector, for controlEvents: UIControl.Event = .touchUpInside) -> Self {
        self.addTarget(target, action: action, for: controlEvents)
        return self
    }

    @discardableResult
    func contentHorizontalAlignment(_ alignment: ContentHorizontalAlignment) -> Self {
        self.contentHorizontalAlignment = alignment
        return self
    }

    @discardableResult
    func contentVerticalAlignment(_ alignment: ContentVerticalAlignment) -> Self {
        self.contentVerticalAlignment = alignment
        return self
    }

}
