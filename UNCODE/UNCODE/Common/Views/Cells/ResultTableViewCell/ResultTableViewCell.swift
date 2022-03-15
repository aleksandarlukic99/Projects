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
    @IBOutlet private weak var resultView: ResultBarView!
    
    private let blurEffect = UIBlurEffect(style: .prominent)
    private lazy var blurEffectView = { UIVisualEffectView(effect: blurEffect) }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer
            .cornerRadius(10)
            .masksToBounds(true)
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
    
    func configure(item: ResultViewItem) {
        subtitleLabel.text(item.subtitle)
        titleLabel.text(item.title)
        infoLabel.text(item.info)
    }

}

private extension ResultTableViewCell {
    
    func commonInit() {
        blurEffectView
            .addAsSubviewOf(contentView)
        subtitleLabel
            .addAsSubviewOf(contentView)
        titleLabel
            .addAsSubviewOf(contentView)
        infoLabel
            .addAsSubviewOf(contentView)
        resultView
            .addAsSubviewOf(contentView)
    }
    
}
