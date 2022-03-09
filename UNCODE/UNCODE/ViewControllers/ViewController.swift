//
//  ViewController.swift
//  UNCODE
//
//  Created by aleksandar on 7.3.22..
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView
            .delegate(self)
            .dataSource(self)
            .rowHeight(UITableView.automaticDimension)
            .register(cellTypes: [ResultTableViewCell.self])
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ResultTableViewCell.self)
        cell.configure(item: .init(title: <#T##String#>, subtitle: <#T##String#>, info: <#T##String#>))
        
        return cell
    }
    
}

struct MetabolicTypeCellItem {
    struct PercentageViewItem {
        let percentage: Int
        let title: String
        let detail: String
    }

    let dailyRecomendation: String
    let proteinItem: PercentageViewItem
    let carbItem: PercentageViewItem
    let fatItem: PercentageViewItem
}

struct ListCellItem {
    struct Item {
        let title: String
        let detail: String
        let detailColor: UIColor
    }
    
    let title: String
    let items: [Item]
}
