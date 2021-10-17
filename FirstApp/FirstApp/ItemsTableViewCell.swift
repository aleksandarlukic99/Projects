//
//  AcinaMalaCelijaTableViewCell.swift
//  FirstApp
//
//  Created by aleksandar on 14.10.21..
//

import UIKit

protocol ItemsTableViewCellDelegate: AnyObject {
    
}

class ItemsTableViewCell: UITableViewCell {
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subtitleLabel: UILabel!
    @IBOutlet private var alertButton: UIButton!
    @IBOutlet private var playerPictureImageView: UIImageView!
    
    weak var delegate: HomeViewController?
    
    override func awakeFromNib() {
        playerPictureImageView.layer.cornerRadius = (playerPictureImageView.frame.width / 2)
        playerPictureImageView.layer.masksToBounds = true
    }
    
    //MARK: - Actions
    
    @IBAction func showAlert() {
        let alert = UIAlertController(
            title: "Igrac",
            message: "Biografija",
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "ok",
            style: .default,
            handler: nil)
        alert.addAction(action)
        delegate?.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Configure
    
    func configure(item: Item) {
        self.titleLabel?.text = item.title
        self.subtitleLabel?.text = item.subtitle
        self.playerPictureImageView?.image = UIImage(named: item.imageName)
    }
 
}


