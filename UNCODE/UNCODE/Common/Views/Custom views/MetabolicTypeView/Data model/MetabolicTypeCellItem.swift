//
//  MetabolicTypeCellItem.swift
//  UNCODE
//
//  Created by aleksandar on 10.3.22..
//

import Foundation
import UIKit

struct MetabolicTypeCellItem {
    struct PercentageViewItem {
        let percentage: Int
        let title: String
        let detail: String
    }

    let dailyRecommendation: String
    let proteinItem: PercentageViewItem
    let carbItem: PercentageViewItem
    let fatItem: PercentageViewItem
}
