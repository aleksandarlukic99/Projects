//
//  ResultBarView.swift
//  UNCODE
//
//  Created by aleksandar on 9.3.22..
//

import UIKit

class ResultBarView: UIView {

    @IBOutlet var contentView: UIView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("ResultBarView", owner: self, options: nil)
        addSubview(contentView)
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    override func draw(_ rect: CGRect) {
        let green = (0...15)
        let yellow = (16...33)
        let red = (34...48)
        for i in green {
            greenLine(x: CGFloat(2 + (i * 6)))
        }
        for i in yellow {
            yellowLine(x: CGFloat(2 + (i * 6)))
        }
        for i in red {
            redLine(x: CGFloat(2 + (i * 6)))
        }
    }
    
    func greenLine(x: CGFloat) {
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(2.0)
        context?.setStrokeColor(UIColor(named: "Green")!.cgColor)
        context?.move(to: CGPoint(x: x, y: 15))
        context?.addLine(to: CGPoint(x: x, y: 40))
        context?.strokePath()
    }
    
    func yellowLine(x: CGFloat) {
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(2.0)
        context?.setStrokeColor(UIColor(named: "Yellow")!.cgColor)
        context?.move(to: CGPoint(x: x, y: 15))
        context?.addLine(to: CGPoint(x: x, y: 40))
        context?.strokePath()
    }
    
    func redLine(x: CGFloat) {
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(2.0)
        context?.setStrokeColor(UIColor(named: "Alert - red")!.cgColor)
        context?.move(to: CGPoint(x: x, y: 15))
        context?.addLine(to: CGPoint(x: x, y: 40))
        context?.strokePath()
    }
}
