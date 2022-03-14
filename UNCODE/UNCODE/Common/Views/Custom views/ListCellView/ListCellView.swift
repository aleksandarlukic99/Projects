//
//  ListCellView.swift
//  UNCODE
//
//  Created by aleksandar on 11.3.22..
//

import UIKit

class ListCellView: UIView {

    @IBOutlet private weak var listView: UIView!
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
        listView.frame = bounds
        listView.layer
            .cornerRadius(8)
            .masksToBounds(true)
        listView
            .backgroundColor(UIColor(red: 255, green: 255, blue: 255, alpha: 0.1))
        let blurEffect = UIBlurEffect(style: .prominent)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = listView.bounds
        listView
            .addSubview(blurEffectView)
        listView
            .addSubview(titleLabel)
        listView
            .addSubview(detailLabel)
    }
    
    func configureView(with item: ListCellItem.Item) {
        titleLabel.text(item.title)
        detailLabel.text(item.detail)
        detailLabel.textColor(item.detailColor)
    }

}
//MARK: - View Setup
private extension ListCellView {
    
    func commonInit() {
        Bundle.main.loadNibNamed("ListCellView", owner: self, options: nil)
        addSubview(listView)
        listView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
}
