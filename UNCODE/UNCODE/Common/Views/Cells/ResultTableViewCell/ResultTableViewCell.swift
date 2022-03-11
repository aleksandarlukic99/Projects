//
//  ResultTableViewCell.swift
//  UNCODE
//
//  Created by aleksandar on 8.3.22..
//

import UIKit

class ResultTableViewCell: UITableViewCell {

    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var infoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
    
    func configure(item: ResultViewItem) {
        self.subtitleLabel.text = item.subtitle
        self.titleLabel.text = item.title
        self.infoLabel.text = item.info
    }

}
