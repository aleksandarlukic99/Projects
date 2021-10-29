//
//  Constants.swift
//  FirstApp
//
//  Created by aleksandar on 21.10.21..
//

import Foundation

enum Constants {
    
    enum Identifiers {
        static let homeID = "ShowHome"
        static let playerID = "ShowPlayer"
        static let loginScreenID = "LoginScreenID"
        static let registerScreenID = "RegisterScreenID"
        static let homePlayersID = "ShowHomePlayers"
    }
    
    enum Wrong {
        static let passAndUsernameTitle = "Wrong password and username"
        static let passAndUsernameMessage = "Username must have at least 4 characters. Password must contain at least 6 characters, 1 uppercase letter, 1 number and no space."
        static let passTitle = "Wrong password"
        static let passMessage = "Password must contain at least 6 characters, 1 uppercase letter, 1 number and no space."
        static let usernameTitle = "Wrong username"
        static let usernameMessage = "Username must have at least 4 characters and no space."
        static let passOrUsernameTitle = "Wrong username or password"
        static let passOrUsernameMessage = "Enter your registered username and password"
    }
    
    enum NemanjaBjelica {
        static let title = "Nemanja Bjelica"
        static let subtitle = "Playing in Golden State Warriors\nHeight: 2.08m\nBorn in: 9 May 1988. (age: 33)\nWeight: 106kg\nCareer overall statistics: Points: 7.9, Assists: 1.8, Rebounds: 4.6."
        static let image = "Bjelica"
    }
    
    enum LukaDoncic {
        static let title = "Luka Doncic"
        static let subtitle = "Playing in Dallas Mavericks\nHeight: 2.01 m\nBorn in: 28 February 1999. (age: 22)\nWeight: 105kg\nCareer overall statistics: Points: 25.7, Assists: 7.7, Rebounds: 8.4."
        static let image = "Doncic"
    }
    
    enum PaulGeorge {
        static let title = "Paul George"
        static let subtitle = "Playing in Los Angeles Clippers\nHeight: 2.03m\nBorn in: 2 May 1990. (age: 31)\nWeight: 100kg\nCareer overall statistics: Points: 20.2, Assists: 3.5, Rebounds: 6.4."
        static let image = "George"
    }
    
    static let cellIdentifier = "RowCell"
    static let ok = "OK"
    static let hello = "Hello"
    
}
