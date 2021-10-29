//
//  ViewController.swift
//  FirstApp
//
//  Created by aleksandar on 14.10.21..
//

import UIKit


class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet private var logoutButton: UIButton!
    
    var players = [
        Item(title: Constants.NemanjaBjelica.title , subtitle: Constants.NemanjaBjelica.subtitle, imageName: Constants.NemanjaBjelica.image),
        Item(title: Constants.LukaDoncic.title, subtitle: Constants.LukaDoncic.subtitle, imageName: Constants.LukaDoncic.image),
        Item(title: Constants.PaulGeorge.title, subtitle: Constants.PaulGeorge.subtitle, imageName: Constants.PaulGeorge.image) ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 40))
        header.backgroundColor = .systemYellow
        
        let label = UILabel(frame: header.bounds)
        let user = UserDefaults.standard.object(forKey: UserDefaults.Keys.userKey) as? String
        label.text = "Hello \(user!)"
        label.textAlignment = .center
        header.addSubview(label)
        
        tableview.tableHeaderView = header
        
    }
    
    //MARK: - Actions
    @IBAction func logoutScreenAction(_ sender: UIButton) {
        UserDefaults.standard.set(false, forKey: UserDefaults.Keys.alreadyLog)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyBoard.instantiateViewController(withIdentifier: Constants.Identifiers.loginScreenID) as! LoginViewController
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
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! ItemTableViewCell
        
        let player = players[indexPath.row]
        cell.configure(item: player)
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let playerList = players[indexPath.row]
        performSegue(
            withIdentifier: Constants.Identifiers.playerID,
            sender: playerList)
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.Identifiers.playerID {
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
            title: Constants.ok,
            style: .default,
            handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}

