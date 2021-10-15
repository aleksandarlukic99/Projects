//
//  ViewController.swift
//  FirstApp
//
//  Created by aleksandar on 14.10.21..
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellIdentifier = "RowCell"
    
    
    @IBOutlet weak var tableview: UITableView!
    
    let players = [
        Item(title: "Nemanja Bjelica", subtitle: "Playing in Golden State Warriors\nHeight: 2.08m\nBorn in: 9 May 1988. (age: 33)", imageName: "Bjelica"),
        Item(title: "Luka Doncic", subtitle: "Playing in Dallas Mavericks\nHeight: 2.01 m\nBorn in: 28 February 1999. (age: 22)", imageName: "Doncic"),
        Item(title: "Paul George", subtitle: "Playing in Los Angeles Clippers\nHeight: 2.03m\nBorn in: 2 May 1990. (age: 31)", imageName: "George")]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
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
      present(alert, animated: true, completion: nil)
    }

    
    
    //MARK: - Table View Cells
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RowCell", for: indexPath) as! AcinaMalaCelijaTableViewCell
        
        let player = players[indexPath.row]
        
        configure(for: cell, with: player)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Configure methods
    
    func configure (
      for cell: UITableViewCell,
      with item: Item
    ) {
      let label = cell.viewWithTag(1000) as! AcinaMalaCelijaTableViewCell
        label.title?.text = item.title
        label.subtitle?.text = item.subtitle
        label.pictureOfPlayer?.image = UIImage(named: item.imageName)
    }
    
}
