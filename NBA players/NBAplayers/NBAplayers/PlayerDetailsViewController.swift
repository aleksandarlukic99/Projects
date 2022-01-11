//
//  PlayerDetailsViewController.swift
//  NBAplayers
//
//  Created by aleksandar on 30.12.21..
//

import UIKit

class PlayerDetailsViewController: UIViewController {

    @IBOutlet private weak var detailsView: UIView!
    @IBOutlet private weak var fullPlayerNameLabel: UILabel!
    @IBOutlet private weak var teamNameLabel: UILabel!
    @IBOutlet private weak var playerPositionLabel: UILabel!
    @IBOutlet private weak var gamesPlayedLabel: UILabel!
    @IBOutlet private weak var averagePointsLabel: UILabel!
    @IBOutlet private weak var cancelButton: UIButton!
    @IBOutlet private weak var averageReboundsLabel: UILabel!
    @IBOutlet private weak var averageAssistsLabel: UILabel!
    @IBOutlet private weak var averageStealsLabel: UILabel!
    
    var searchResults: PlayerData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsView.layer.cornerRadius = 15
        
        updateUI()
        fetchData()
    }
    
    //MARK: - Actions
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    //MARK: - Methods
    
    func updateUI() {
        fullPlayerNameLabel.text = "\(searchResults.first_name) \(searchResults.last_name)"
        teamNameLabel.text = "Player team: \(searchResults.team.full_name)"
        playerPositionLabel.text = "Player position: \(searchResults.position)"
    }
    
    func fetchData() {
        let stringURL = "https://www.balldontlie.io/api/v1/season_averages?season=2018&player_ids[]=\(searchResults.id)"
        guard let url = URL(string: stringURL) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let jsonResult = try JSONDecoder().decode(SecondAPI.self, from: data)
                DispatchQueue.main.async {
                    self.averageReboundsLabel.text = "Average rebounds: \(jsonResult.data.first?.reb ?? 0.0)"
                    self.averagePointsLabel.text = "Average points: \(jsonResult.data.first?.pts ?? 0.0)"
                    self.averageStealsLabel.text = "Average steals: \(jsonResult.data.first?.stl ?? 0.0)"
                    self.averageAssistsLabel.text = "Average assists: \(jsonResult.data.first?.ast ?? 0.0)"
                    self.gamesPlayedLabel.text = "Games played: \(jsonResult.data.first?.games_played ?? 0)"
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
