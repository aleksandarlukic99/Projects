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
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var infoLabel: UILabel!
    
    private let blurEffect = UIBlurEffect(style: .prominent)
    private lazy var blurEffectView = { UIVisualEffectView(effect: blurEffect) }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        isUserInteractionEnabled(false)
        infoLabel
            .numberOfLines = 0
        commonInit()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        blurEffectView.frame = contentView.bounds
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
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

private extension MetabolicTypeTableViewCell {
    
    func commonInit() {
        contentView.layer
            .cornerRadius(10)
            .masksToBounds(true)
        blurEffectView
            .addAsSubviewOf(contentView)
        stackView
            .addAsSubviewOf(contentView)
        dailyRecommendation
            .addAsSubviewOf(contentView)
        subtitleLabel
            .addAsSubviewOf(contentView)
        titleLabel
            .addAsSubviewOf(contentView)
        infoLabel
            .addAsSubviewOf(contentView)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoLabel.heightAnchor.constraint(equalToConstant: 41)
        ])
        
    }
    
}
