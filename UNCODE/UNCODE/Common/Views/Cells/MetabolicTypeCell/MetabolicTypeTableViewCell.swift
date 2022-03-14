//
//  MetabolicTypeTableViewCell.swift
//  UNCODE
//
//  Created by aleksandar on 10.3.22..
//

import UIKit

class MetabolicTypeTableViewCell: UITableViewCell {

    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var dailyRecommendation: UILabel!
    @IBOutlet private weak var carbView: MetabolicTypeView!
    @IBOutlet private weak var fatView: MetabolicTypeView!
    @IBOutlet private weak var proteinView: MetabolicTypeView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        isUserInteractionEnabled(false)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
        contentView.layer
            .cornerRadius(10)
            .masksToBounds(true)
    }
    
    func configure(with item: MetabolicTypeCellItem) {
        dailyRecommendation.text("Daily calorie requirements: \(item.dailyRecommendation) kcal")
        
        let proteinItem = item.proteinItem
        proteinView.configureView(with: proteinItem)
        
        let carbItem = item.carbItem
        carbView.configureView(with: carbItem)
        
        let fatItem = item.fatItem
        fatView.configureView(with: fatItem)
    }
    
}
