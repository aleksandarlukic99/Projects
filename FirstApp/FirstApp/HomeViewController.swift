//
//  ViewController.swift
//  FirstApp
//
//  Created by aleksandar on 14.10.21..
//

import UIKit


class HomeViewController: UIViewController {
    
    let cellIdentifier = "RowCell"
    
    @IBOutlet weak var tableview: UITableView!
    
    var players = [
        Item(title: "Nemanja Bjelica", subtitle: "Playing in Golden State Warriors\nHeight: 2.08m\nBorn in: 9 May 1988. (age: 33)", imageName: "Bjelica"),
        Item(title: "Luka Doncic", subtitle: "Playing in Dallas Mavericks\nHeight: 2.01 m\nBorn in: 28 February 1999. (age: 22)", imageName: "Doncic"),
        Item(title: "Paul George", subtitle: "Playing in Los Angeles Clippers\nHeight: 2.03m\nBorn in: 2 May 1990. (age: 31)", imageName: "George")]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
    }
    
}

extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController: UITableViewDataSource {
    //MARK: - Table View Cells
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ItemsTableViewCell
        
        let player = players[indexPath.row]
        cell.configure(item: player)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
