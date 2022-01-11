//
//  PlayersTableViewCell.swift
//  NBAplayers
//
//  Created by aleksandar on 30.12.21..
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
    
    static let identifier = "PlayerTableViewCell"
    
    @IBOutlet private weak var playerNameLabel: UILabel!
    @IBOutlet private weak var playerTeamLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Methods
    
    public func configure(for result: PlayerData) {
        playerNameLabel.text = "\(result.first_name) \(result.last_name)"
        playerTeamLabel.text = "Team: \(result.team.full_name)"
    }
    
}
