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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.isUserInteractionEnabled(false)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
    }
    
}
