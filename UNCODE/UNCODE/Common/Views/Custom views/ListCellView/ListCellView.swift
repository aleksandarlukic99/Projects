//
//  ListCellView.swift
//  UNCODE
//
//  Created by aleksandar on 11.3.22..
//

import UIKit

class ListCellView: UIView {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var detailLabel: UILabel!
    
    //MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    //MARK: - Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
    }
    
    func configureView(with item: ListCellItem.Item) {
        self.titleLabel.text = item.title
        self.detailLabel.text = item.detail
    }

}
//MARK: - View Setup
private extension ListCellView {
    
    func commonInit() {
        Bundle.main.loadNibNamed("ListCellView", owner: self, options: nil)
    }
    
}
