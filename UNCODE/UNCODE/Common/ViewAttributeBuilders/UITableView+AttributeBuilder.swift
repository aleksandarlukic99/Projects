//
//  UITableView+AttributeBuilder.swift
//  BunchAI
//
//  Created by Domagoj Stankovic on 17.02.2022..
//  Copyright © 2022 Bunch. All rights reserved.
//

import UIKit

extension UITableView {
    @discardableResult
    func delegate(_ delegate: UITableViewDelegate) -> Self {
        self.delegate = delegate
        return self
    }

    @discardableResult
    func dataSource(_ dataSource: UITableViewDataSource) -> Self {
        self.dataSource = dataSource
        return self
    }

    @discardableResult
    func rowHeight(_ dataSource: CGFloat) -> Self {
        self.rowHeight = rowHeight
        return self
    }

    @discardableResult
    func separatorStyle(_ separatorStyle: UITableViewCell.SeparatorStyle) -> Self {
        self.separatorStyle = separatorStyle
        return self
    }

    @discardableResult
    final func register(cellTypes: [UITableViewCell.Type]) -> Self {
        for cellType in cellTypes {
            register(cellType: cellType)
        }
        return self
    }
}
