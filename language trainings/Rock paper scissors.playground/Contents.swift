import UIKit

func randomChoice() -> String {
    let rockPaperScissors = ["rock", "paper", "scissors"]
    return rockPaperScissors.randomElement()!
}

func rockPaperScissors(choose: String, computer: String) {
    if choose == computer {
        print("It's even")
    } else if choose == "paper" && computer == "rock" {
        print("You win!")
    } else if choose == "rock" && computer == "scissors" {
        print("You win!")
    } else if choose == "scissors" && computer == "paper" {
        print("You win!")
    } else if choose == "paper" && computer == "scissors" {
        print("You lose.")
    } else if choose == "rock" && computer == "paper" {
        print("You lose")
    } else if choose == "scissors" && computer == "rock" {
        print("You lose")
    } else {
        print("Somethings gone wrong.")
    }
}

rockPaperScissors(choose: randomChoice(), computer: randomChoice())
