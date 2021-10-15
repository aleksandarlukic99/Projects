//
//  AcinaMalaCelijaTableViewCell.swift
//  FirstApp
//
//  Created by aleksandar on 14.10.21..
//

import UIKit

class AcinaMalaCelijaTableViewCell: UITableViewCell {
    
    @IBOutlet var title: UILabel!
    @IBOutlet var subtitle: UILabel!
    @IBOutlet var alertButton: UIButton!
    @IBOutlet var pictureOfPlayer: UIImageView!
    
    override func layoutSubviews() {
        pictureOfPlayer.layer.cornerRadius = (pictureOfPlayer.frame.width / 2)
        pictureOfPlayer.layer.masksToBounds = true
    }
}
