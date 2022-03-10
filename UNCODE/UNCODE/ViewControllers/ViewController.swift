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
            .register(cellTypes: [ResultTableViewCell.self, MetabolicTypeTableViewCell.self])
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ResultTableViewCell.self)
        let cell2 = tableView.dequeueReusableCell(for: indexPath, cellType: MetabolicTypeTableViewCell.self)
        
        return cell2
    }
    
}

