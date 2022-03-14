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
        contentView.layer
            .cornerRadius(10)
            .masksToBounds(true)
    }
    
    func configure(item: ResultViewItem) {
        subtitleLabel.text(item.subtitle)
        titleLabel.text(item.title)
        infoLabel.text(item.info)
    }

}
