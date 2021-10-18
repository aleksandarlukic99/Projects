//
//  AcinaMalaCelijaTableViewCell.swift
//  FirstApp
//
//  Created by aleksandar on 14.10.21..
//

import UIKit

protocol ItemsTableViewCellDelegate {
    func buttonPress(_ cell: ItemsTableViewCell)
}

class ItemsTableViewCell: UITableViewCell {
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subtitleLabel: UILabel!
    @IBOutlet private var alertButton: UIButton!
    @IBOutlet private var playerPictureImageView: UIImageView!
    
    var item: Item!
    var delegate: ItemsTableViewCellDelegate?
    
    override func awakeFromNib() {
        playerPictureImageView.layer.cornerRadius = (playerPictureImageView.frame.width / 2)
        playerPictureImageView.layer.masksToBounds = true
    }
    
    //MARK: - Actions
    
    @IBAction func showAlert(_ sender: Any) {
        self.delegate?.buttonPress(self)
    }
    
    //MARK: - Configure
    
    func configure(item: Item) {
        self.titleLabel?.text = item.title
        self.subtitleLabel?.text = item.subtitle
        self.playerPictureImageView?.image = UIImage(named: item.imageName)
    }
    
}


