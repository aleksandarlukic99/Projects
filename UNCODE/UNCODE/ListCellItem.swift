//
//  ListCellItem.swift
//  UNCODE
//
//  Created by aleksandar on 10.3.22..
//

import Foundation
import UIKit

struct ListCellItem {
    struct Item {
        let title: String
        let detail: String
        let detailColor: UIColor
    }
    
    let title: String
    let items: [Item]
}
