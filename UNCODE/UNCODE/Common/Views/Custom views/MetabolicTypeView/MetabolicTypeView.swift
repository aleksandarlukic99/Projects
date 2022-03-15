//
//  MetabolicTypeView.swift
//  UNCODE
//
//  Created by aleksandar on 10.3.22..
//

import UIKit

class MetabolicTypeView: UIView {
    //MARK: - Properties
    @IBOutlet private weak var backgroundView: UIView!
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
        super.layoutSubviews()
        let blurEffect = UIBlurEffect(style: .prominent)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = backgroundView.bounds
        blurEffectView
            .addAsSubviewOf(backgroundView)
        percentView
            .addAsSubviewOf(backgroundView)
        titleLabel
            .addAsSubviewOf(percentView)
        detailPercent
            .addAsSubviewOf(percentView)
    }
    
    func configureView(with item: MetabolicTypeCellItem.PercentageViewItem) {
        titleLabel.text = item.title
        detailPercent.text = "\(item.percentage)%"
        configurePercents(percents: item.percentage)
    }
    
    func configurePercents(percents: Int) {
        let constraintWidth = (Int(percentView.frame.size.width) / 100) * (100 - percents)
        percentViewTrailingConstraint.constant = CGFloat(constraintWidth)
    }

}
//MARK: - View Setup
private extension MetabolicTypeView {
    
    func commonInit() {
        Bundle.main.loadNibNamed("MetabolicTypeView", owner: self, options: nil)
        addSubview(backgroundView)
        backgroundView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        backgroundView.layer
            .cornerRadius(8)
            .masksToBounds(true)
        backgroundView
            .backgroundColor(UIColor(red: 255, green: 255, blue: 255, alpha: 0.1))
    }
    
}

