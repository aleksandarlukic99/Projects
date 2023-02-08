//
//  UILabel+AttributeBuilder.swift
//  BunchAI
//
//  Created by Domagoj Stankovic on 27.01.2022..
//  Copyright © 2022 Bunch. All rights reserved.
//

import UIKit

extension UILabel {
    @discardableResult
    func text(_ text: String?) -> Self {
        self.text = text
        return self
    }

    @discardableResult
    func font(_ font: UIFont) -> Self {
        self.font = font
        return self
    }

    @discardableResult
    func textColor(_ textColor: UIColor) -> Self {
        self.textColor = textColor
        return self
    }

    @discardableResult
    func textAlignment(_ textAlignment: NSTextAlignment) -> Self {
        self.textAlignment = textAlignment
        return self
    }

    @discardableResult
    func lineBreakMode(_ lineBreakMode: NSLineBreakMode) -> Self {
        self.lineBreakMode = lineBreakMode
        return self
    }

    @discardableResult
    func adjustsFontSizeToFitWidth(_ adjustsFontSizeToFitWidth: Bool) -> Self {
        self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        return self
    }

    @discardableResult
    func minimumScaleFactor(_ minimumScaleFactor: CGFloat) -> Self {
        self.minimumScaleFactor = minimumScaleFactor
        return self
    }

    @discardableResult
    func numberOfLines(_ numberOfLines: Int) -> Self {
        self.numberOfLines = numberOfLines
        return self
    }

    @discardableResult
    func attributedText(_ attributedText: NSAttributedString?) -> Self {
        self.attributedText = attributedText
        return self
    }

    @discardableResult
    func multipleLines(_ numberOfLines: Int = 0) -> Self {
        self.numberOfLines(0)
            .lineBreakMode(.byWordWrapping)
    }

    @discardableResult
    func hideIfNoText() -> Self {
        isHidden(text?.isEmpty ?? true)
    }
}
