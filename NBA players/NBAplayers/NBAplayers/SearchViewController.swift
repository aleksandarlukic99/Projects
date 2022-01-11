//
//  ViewController.swift
//  NBAplayers
//
//  Created by aleksandar on 30.12.21..
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    var searchResults = [PlayerData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //MARK: - Methods
    
    func fetchData(searchText: String) {
        let stringURL = "https://www.balldontlie.io/api/v1/players/?&per_page=50/?&search=\(searchText)"
        guard let url = URL(string: stringURL) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let jsonResult = try JSONDecoder().decode(APIResponse.self, from: data)
                DispatchQueue.main.async {
                    self.searchResults = jsonResult.data
                    self.tableView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.noResultsAction()
                }
            }
        }
        task.resume()
    }
    
    func noResultsAction() {
        let alert = UIAlertController(title: "No results", message: "Sorry, we have no that player in data base.", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlayerDetails" {
            let playerDetailsVC = segue.destination as! PlayerDetailsViewController
            let indexPath = sender as! IndexPath
            let playerResults = searchResults[indexPath.row]
            playerDetailsVC.searchResults = playerResults
        }
    }

}

//MARK: - Search and TableView delegates

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchResult = searchResults[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: PlayerTableViewCell.identifier, for: indexPath) as! PlayerTableViewCell
        cell.configure(for: searchResult)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "PlayerDetails", sender: indexPath)
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let text = searchBar.text {
            let urlText = text.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
            searchResults = []
            tableView.reloadData()
            fetchData(searchText: urlText!)
        }
    }
}
