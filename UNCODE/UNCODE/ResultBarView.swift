//
//  ResultBarView.swift
//  UNCODE
//
//  Created by aleksandar on 9.3.22..
//

import UIKit

class ResultBarView: UIView {
    // MARK: - Properties
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var stackView: UIStackView!

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    // MARK: - Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView
            .spacing(stackView.frame.width / 99)
    }
}

//MARK: - View setup
private extension ResultBarView {
    func commonInit() {
        Bundle.main.loadNibNamed("ResultBarView", owner: self, options: nil)
        addSubview(contentView)
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        let redView = UIView()
        redView
            .backgroundColor(.red)
        let greenView = UIView()
        greenView
            .backgroundColor(.green)

        for i in 0...49 {
            var color: UIColor

            switch i {
            case 0...15:
                color = R.color.green()!
            case 16...33:
                color = R.color.yellow()!
            case 34...50:
                color = R.color.alertRed()!
            default:
                fatalError()
            }
            let bar = UIView()
                .backgroundColor(color)

            stackView.addArrangedSubview(bar)
        }
    }
}