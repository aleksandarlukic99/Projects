//
//  DetailsViewController.swift
//  FirstApp
//
//  Created by aleksandar on 16.10.21..
//

import UIKit

class DetailsViewController: UIViewController {
    
    var item: Item!

    @IBOutlet private var fullSubtitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = item.title
        self.fullSubtitleLabel.text = item.subtitle
    }
    
}
