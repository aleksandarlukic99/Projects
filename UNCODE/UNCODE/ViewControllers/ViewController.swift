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
                dailyRecommendation: 20,
                proteinItem: .init(
                    percentage: 30,
                    title: "Protiein",
                    detail: "AAA"
                ),
                carbItem: .init(
                    percentage: 20,
                    title: "Carb",
                    detail: "BBB"
                ),
                fatItem: .init(
                    percentage: 40,
                    title: "Fat",
                    detail: "CCC"
                )
            )
        ),
        CellTypes.listCell(
            .init(
                title: "TEST",
                items: [
                    .init(title: "AAAA", detail: "BBBB", detailColor: .green),
                    .init(title: "AAAA", detail: "BBBB", detailColor: .green),
                    .init(title: "AAAA", detail: "BBBB", detailColor: .green),
                    .init(title: "AAAA", detail: "BBBB", detailColor: .green)
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

