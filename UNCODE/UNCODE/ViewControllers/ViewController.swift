//
//  ViewController.swift
//  UNCODE
//
//  Created by aleksandar on 7.3.22..
//

import UIKit

class ViewController: UIViewController {

    enum CellTypes {
        case resultCell
        case metabolicCell(MetabolicTypeCellItem)
        case listCell(ListCellItem)
    }

    @IBOutlet private weak var tableView: UITableView!

    let models = [
        CellTypes.resultCell,
        CellTypes.metabolicCell(
            .init(
                dailyRecommendation: 1429,
                proteinItem: .init(percentage: 1, title: "Protiein", detail: ""),
                carbItem: .init( percentage: 5, title: "Carbohydrates", detail: ""),
                fatItem: .init(percentage: 10, title: "Fat", detail: "")
            )
        ),
        CellTypes.listCell(
            .init(
                title: "Sensitivities",
                items: [
                    .init(title: "Cafein", detail: "Normal", detailColor: .green),
                    .init(title: "Gluten", detail: "Elevated", detailColor: .red),
                    .init(title: "Salt", detail: "Slightly increased", detailColor: .yellow)
                ]
            )
        )
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView
            .delegate(self)
            .dataSource(self)
            .rowHeight(UITableView.automaticDimension)
            .register(cellTypes: [ResultTableViewCell.self, MetabolicTypeTableViewCell.self, ListTableViewCell.self])
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch models[indexPath.row] {
        case .resultCell:
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ResultTableViewCell.self)
            return cell
        case let .metabolicCell(item):
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: MetabolicTypeTableViewCell.self)
            cell.configure(with: item)
            return cell
        case let .listCell(item):
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ListTableViewCell.self)
            cell.configure(with: item)
            return cell
        }
    }
}

