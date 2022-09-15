//
//  ViewController.swift
//  Snapkit Training
//
//  Created by aleksandar on 16.6.22..
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Blue box
        let blueBox = UIView()
        view.addSubview(blueBox)
        blueBox.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(200)
            make.center.equalTo(view)
            
        }
        blueBox.backgroundColor = .blue
        blueBox.layer.borderColor = UIColor.green.cgColor
        blueBox.layer.borderWidth = 10
        
        //Orange box
        let orangeCircle = UIView()
        view.addSubview(orangeCircle)
        orangeCircle.snp.makeConstraints { make in
            make.width.equalTo(90)
            make.height.equalTo(90)
            make.center.equalTo(blueBox)
        }
        orangeCircle.backgroundColor = .orange
        orangeCircle.layer.cornerRadius = 45
        orangeCircle.layer.masksToBounds = true
        orangeCircle.layer.borderColor = UIColor.red.cgColor
        orangeCircle.layer.borderWidth = 4
        
        //Label
        let label = UILabel()
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.centerX.equalToSuperview().inset(90)
            make.right.equalTo(view).inset(30)
            make.left.equalTo(view).inset(30)
        }
        label.text = "Always be aware of traffic lights."
        label.textColor = .brown
        label.font = label.font.withSize(35)
        label.numberOfLines = 0
        label.textAlignment = .center
        
        //Traffic light
        let trafficLight = UIView()
        view.addSubview(trafficLight)
        trafficLight.snp.makeConstraints { make in
            make.bottom.centerX.equalToSuperview().inset(50)
            make.width.equalTo(150)
            make.height.equalTo(300)
        }
        trafficLight.backgroundColor = .gray
        trafficLight.layer.borderWidth = 10
        trafficLight.layer.borderColor = UIColor.darkGray.cgColor
        
        //Red traffic light
        let redLight = UIView()
        trafficLight.addSubview(redLight)
        redLight.snp.makeConstraints { make in
            make.width.equalTo(65)
            make.height.equalTo(65)
            make.top.centerX.equalTo(trafficLight).inset(30)
        }
        redLight.backgroundColor = .red
        redLight.layer.cornerRadius = 65 / 2
        redLight.layer.masksToBounds = true
        redLight.layer.borderColor = UIColor.black.cgColor
        redLight.layer.borderWidth = 4
        
        //Yellow light
        let yellowLight = UIView()
        trafficLight.addSubview(yellowLight)
        yellowLight.snp.makeConstraints { make in
            make.width.equalTo(65)
            make.height.equalTo(65)
            make.center.equalTo(trafficLight)
        }
        yellowLight.backgroundColor = .yellow
        yellowLight.layer.cornerRadius = 65 / 2
        yellowLight.layer.masksToBounds = true
        yellowLight.layer.borderColor = UIColor.black.cgColor
        yellowLight.layer.borderWidth = 4
        
        //Green light
        let greenLight = UIView()
        trafficLight.addSubview(greenLight)
        greenLight.snp.makeConstraints { make in
            make.width.equalTo(65)
            make.height.equalTo(65)
            make.bottom.centerX.equalTo(trafficLight).inset(30)
        }
        greenLight.backgroundColor = .green
        greenLight.layer.cornerRadius = 65 / 2
        greenLight.layer.masksToBounds = true
        greenLight.layer.borderColor = UIColor.black.cgColor
        greenLight.layer.borderWidth = 4
    }

}

