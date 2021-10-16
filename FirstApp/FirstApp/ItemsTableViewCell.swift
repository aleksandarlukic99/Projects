//
//  AcinaMalaCelijaTableViewCell.swift
//  FirstApp
//
//  Created by aleksandar on 14.10.21..
//

import UIKit

class ItemsTableViewCell: UITableViewCell {
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subtitleLabel: UILabel!
    @IBOutlet private var alertButton: UIButton!
    @IBOutlet private var playerPictureImageView: UIImageView!
    
    
    override func awakeFromNib() {
        playerPictureImageView.layer.cornerRadius = (playerPictureImageView.frame.width / 2)
        playerPictureImageView.layer.masksToBounds = true
    }
    
    //MARK: - Actions
    
    @IBAction func showAlert() {
        let alert = UIAlertController(
          title: "This is player.",
          message: "He is good.",
          preferredStyle: .alert)

        let action = UIAlertAction(
          title: "OK",
          style: .default,
          handler: nil)

        alert.addAction(action)
    }
    
    //MARK: - Configure
    
    func configure(for cell: ItemsTableViewCell, with item: Item) {
        cell.titleLabel?.text = item.title
        cell.subtitleLabel?.text = item.subtitle
        cell.playerPictureImageView?.image = UIImage(named: item.imageName)
    }
 
}

