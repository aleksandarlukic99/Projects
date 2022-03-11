//
//  MetabolicTypeView.swift
//  UNCODE
//
//  Created by aleksandar on 10.3.22..
//

import UIKit

class MetabolicTypeView: UIView {
    //MARK: - Properties
    @IBOutlet private var backgroundView: UIView!
    @IBOutlet private weak var percentView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var detailPercent: UILabel!
    @IBOutlet private weak var percentViewTrailingConstraint: NSLayoutConstraint!
    
    //MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override func layoutSubviews() {
        backgroundView.layer.cornerRadius = 8
        backgroundView.layer.masksToBounds = true
        backgroundView.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.1)
        let blurEffect = UIBlurEffect(style: .prominent)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = backgroundView.bounds
        backgroundView.addSubview(blurEffectView)
        backgroundView.addSubview(percentView)
        percentView.addSubview(titleLabel)
        percentView.addSubview(detailPercent)
        percentViewTrailingConstraint.constant = 50
    }
    
    func configureView(with item: MetabolicTypeCellItem.PercentageViewItem) {
        self.titleLabel.text = item.title
        self.detailPercent.text = item.detail
    }

}
//MARK: - View Setup
private extension MetabolicTypeView {
    
    func commonInit() {
        Bundle.main.loadNibNamed("MetabolicTypeView", owner: self, options: nil)
        addSubview(backgroundView)
        backgroundView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
}

