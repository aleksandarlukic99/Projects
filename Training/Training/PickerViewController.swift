//
//  PickerViewController.swift
//  Training
//
//  Created by aleksandar on 21.1.22..
//

import UIKit

class PickerViewController: UIViewController {
    
    @IBOutlet weak var numberPicker: UIPickerView!
    
    let array = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberPicker.dataSource = self
        numberPicker.delegate = self
        
        let rotationAngle: CGFloat = -90 * (.pi / 180)
        numberPicker.transform = CGAffineTransform(rotationAngle: rotationAngle)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        numberPicker.frame = CGRect(x: -150, y: view.center.y - 200, width: view.bounds.width + 300, height: 100)
    }
}

extension PickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        let label = UILabel()
        if pickerView.selectedRow(inComponent: component) == row {
            label.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            label.textAlignment = .center
            label.font = .boldSystemFont(ofSize: 30)
            label.text = array[row]
            label.textColor = .green
            view.addSubview(label)
        } else {
            label.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            label.textAlignment = .center
            label.font = .boldSystemFont(ofSize: 30)
            label.text = array[row]
            view.addSubview(label)
        }
        pickerView.subviews[1].backgroundColor = .none
        
        //rotate view
        view.transform = CGAffineTransform(rotationAngle: 90 * (.pi / 180))
        
        return view
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.reloadComponent(component)
    }
}
