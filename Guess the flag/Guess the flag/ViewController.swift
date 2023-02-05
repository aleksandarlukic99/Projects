//
//  ViewController.swift
//  Guess the flag
//
//  Created by Aleksandar Lukic on 5.2.23..
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAnswered = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia" , "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased() + " - Score: \(score) / \(questionsAnswered)"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var alertTitle: String
        
        if sender.tag == correctAnswer {
            alertTitle = "Correct"
            score += 1
            questionsAnswered += 1
        } else {
            alertTitle = "Wrong, this is flag of \(countries[correctAnswer].uppercased())"
            score -= 1
            questionsAnswered += 1
        }
        
        if questionsAnswered == 10 {
            let alert = UIAlertController(title: "Game over", message: "Your final score is \(score) / \(questionsAnswered)", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Restart", style: .default)
            score = 0
            questionsAnswered = 0
            title = countries[correctAnswer].uppercased() + " - Score: \(score) / \(questionsAnswered)"
            alert.addAction(alertAction)
            present(alert, animated: true)
        } else if questionsAnswered < 10 {
            let alert = UIAlertController(title: alertTitle, message: "Your score is \(score) / \(questionsAnswered)", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Continue", style: .default) { _ in
                self.askQuestion()
            }
            alert.addAction(alertAction)
            present(alert, animated: true)
        }
    }
}
