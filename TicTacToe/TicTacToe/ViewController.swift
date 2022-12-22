//
//  ViewController.swift
//  TicTacToe
//
//  Created by Aleksandar Lukic on 22.12.22..
//

import UIKit

class ViewController: UIViewController {
    
    enum Turn {
        case O
        case X
    }

    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    @IBOutlet weak var XScoreLabel: UILabel!
    @IBOutlet weak var OScoreLabel: UILabel!
    
    var firstTurn = Turn.X
    var currentTurn = Turn.X
    
    var X = "X"
    var O = "O"
    var board = [UIButton]()
    
    var XScore = 0
    var OScore = 0
    
    func initBoard() {
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()
        
        OScoreLabel.text = String(OScore)
    }
    
    //MARK: - Actions
    
    @IBAction func tapBoard(_ sender: UIButton) {
        addToBoard(sender)
        
        if checkForVictory(X) {
            XScore += 1
            XScoreLabel.text = String(XScore)
            resultAlert(title: "X WON!")
        }
        
        if checkForVictory(O) {
            OScore += 1
            OScoreLabel.text = String(OScore)
            resultAlert(title: "O WON!")
        }
        
        if fullBoard() {
            resultAlert(title: "Draw!")
        }
    }
    
    @IBAction func resetScores(_ sender: Any) {
        XScore = 0
        OScore = 0
        XScoreLabel.text = String(XScore)
        OScoreLabel.text = String(OScore)
        resetBoard()
    }
    
    //MARK: - Methods
    
    func addToBoard(_ sender: UIButton) {
        if sender.title(for: .normal) == nil {
            if currentTurn == Turn.O {
                sender.setTitle(O, for: .normal)
                currentTurn = Turn.X
                turnLabel.text = X
            } else if currentTurn == Turn.X {
                sender.setTitle(X, for: .normal)
                currentTurn = Turn.O
                turnLabel.text = O
            }
            sender.isEnabled = false
        }
    }
    
    func fullBoard() -> Bool {
        for button in board {
            if button.title(for: .normal) == nil {
                return false
            }
        }
        return true
    }
    
    func resultAlert(title: String) {
        let message = "\nX score: " + String(XScore) + "\nO score: " + String(OScore)
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { _ in
            self.resetBoard()
        }))
        present(ac, animated: true)
    }
    
    func resetBoard() {
        for button in board {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        if currentTurn == Turn.O {
            currentTurn = Turn.X
            turnLabel.text = X
        } else if currentTurn == Turn.X {
            currentTurn = Turn.O
            turnLabel.text = O
        }
        currentTurn = firstTurn
    }
    
    func checkForVictory(_ s: String) -> Bool {
        //Horizontal
        if thisSymbol(a1, s) && thisSymbol(a2, s) && thisSymbol(a3, s) {
            return true
        }
        if thisSymbol(b1, s) && thisSymbol(b2, s) && thisSymbol(b3, s) {
            return true
        }
        if thisSymbol(c1, s) && thisSymbol(c2, s) && thisSymbol(c3, s) {
            return true
        }
        //Diagonal
        if thisSymbol(a1, s) && thisSymbol(b2, s) && thisSymbol(c3, s) {
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b2, s) && thisSymbol(c1, s) {
            return true
        }
        //Vertical
        if thisSymbol(a1, s) && thisSymbol(b1, s) && thisSymbol(c1, s) {
            return true
        }
        if thisSymbol(a2, s) && thisSymbol(b2, s) && thisSymbol(c2, s) {
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b3, s) && thisSymbol(c3, s) {
            return true
        }
        return false
    }
    
    func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool {
        return button.title(for: .normal) == symbol
    }

}

