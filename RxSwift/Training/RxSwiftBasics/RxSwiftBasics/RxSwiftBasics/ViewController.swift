//
//  ViewController.swift
//  RxSwiftBasics
//
//  Created by aleksandar on 28.3.22..
//

import UIKit
import RxCocoa
import RxSwift
import RxRelay

struct Product {
    let imageName: String
    let title: String
}

struct ProductViewModel {
    var items = PublishSubject<[Product]>()
    
    func fetchItems() {
        let products = [
        Product(imageName: "house", title: "Home"),
        Product(imageName: "trash", title: "Trash"),
        Product(imageName: "archivebox", title: "Archive Box"),
        Product(imageName: "calendar", title: "Calendar"),
        Product(imageName: "magazine", title: "Magazine")
        ]
        
        items.onNext(products)
        items.onCompleted()
    }
    
}

class ViewController: UIViewController {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
    }()
    
    private var productModel = ProductViewModel()
    
    private var bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        bindTableData()
    }
    
    func bindTableData() {
        //Bind items to table
        productModel.items.bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: UITableViewCell.self)) { row, item, cell in
            cell.textLabel?.text = item.title
            cell.imageView?.image = UIImage(systemName: item.imageName)
        }
        .disposed(by: bag)
        
        //Bind a model selected handle
        tableView.rx.modelSelected(Product.self).bind { product in
            print(product.title)
        }
        .disposed(by: bag)
        
        //fetch items
        productModel.fetchItems()
    }

}

