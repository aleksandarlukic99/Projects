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
    @IBOutlet private var logoutButton: UIButton!
    
    var players = [
        Item(title: "Nemanja Bjelica", subtitle: "Playing in Golden State Warriors\nHeight: 2.08m\nBorn in: 9 May 1988. (age: 33)\nWeight: 106kg\nCareer overall statistics: Points: 7.9, Assists: 1.8, Rebounds: 4.6.", imageName: "Bjelica"),
        Item(title: "Luka Doncic", subtitle: "Playing in Dallas Mavericks\nHeight: 2.01 m\nBorn in: 28 February 1999. (age: 22)\nWeight: 105kg\nCareer overall statistics: Points: 25.7, Assists: 7.7, Rebounds: 8.4.", imageName: "Doncic"),
        Item(title: "Paul George", subtitle: "Playing in Los Angeles Clippers\nHeight: 2.03m\nBorn in: 2 May 1990. (age: 31)\nWeight: 100kg\nCareer overall statistics: Points: 20.2, Assists: 3.5, Rebounds: 6.4.", imageName: "George")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 40))
        header.backgroundColor = .systemYellow
        
        let label = UILabel(frame: header.bounds)
        label.text =  "Hello"
        label.textAlignment = .center
        header.addSubview(label)
        
        tableview.tableHeaderView = header
        
    }
    
    //MARK: - Actions
    @IBAction func logoutScreenAction(_ sender: UIButton) {
        UserDefaults.standard.set(false, forKey: "alreadyLoggedInKey")
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyBoard.instantiateViewController(withIdentifier: "LoginScreenID") as! LoginViewController
        destinationVC.modalPresentationStyle = .fullScreen
        present(destinationVC, animated: true, completion: nil)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ItemTableViewCell
        
        let player = players[indexPath.row]
        cell.configure(item: player)
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let playerList = players[indexPath.row]
        performSegue(
            withIdentifier: "ShowPlayer",
            sender: playerList)
        UserDefaults.standard.set(indexPath.row, forKey: "ItemIndex")
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPlayer" {
            let playerList = segue.destination as! DetailsViewController
            playerList.item = sender as? Item
        }
    }
}

extension HomeViewController: ItemTableViewCellDelegate {
    func itemCellDidTapButton(_ cell: ItemTableViewCell) {
        let indexPath = tableview.indexPath(for: cell)
        let player = players[indexPath!.row]
        let alert = UIAlertController(
            title: player.title,
            message: player.subtitle,
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}

