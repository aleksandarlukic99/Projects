//
//  LoginViewController.swift
//  FirstApp
//
//  Created by aleksandar on 19.10.21..
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet private var usernameTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var submitButton: UIButton!
    
    let userDefaults = UserDefaults.standard
    
    var signedIn = false
    var choosenUsername = ""
    var choosenPassword = ""
    let passKey = "passwordKey"
    let userKey = "usernameKey"
    let signedKey = "signedInKey"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        loadingUser()
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let myPassword = isPasswordValid(password: passwordTextField.text ?? "")
        let myUsername = isUsernameValid(username: usernameTextField.text ?? "")
        let wrongPassAndUsernameTitle = "Wrong password and username"
        let wrongPassAndUsernameMessage = "Username must have at least 4 characters. Password must contain at least 6 characters, 1 uppercase letter, 1 number and no space."
        let wrongPassTitle = "Wrong password"
        let wrongPassMessage = "Password must contain at least 6 characters, 1 uppercase letter, 1 number and no space."
        let wrongUsernameTitle = "Wrong username"
        let wrongUsernameMessage = "Username must have at least 4 characters and no space."
        
        if myPassword == false && myUsername == false {
            loginAlerts(title: wrongPassAndUsernameTitle, message: wrongPassAndUsernameMessage)
        } else if myPassword == false && myUsername == true {
            loginAlerts(title: wrongPassTitle, message: wrongPassMessage)
        } else if myPassword == true && myUsername == false {
            loginAlerts(title: wrongUsernameTitle, message: wrongUsernameMessage)
        } else {
            if signedIn == false {
                signedIn = true
                guard let usernameText = usernameTextField.text, let passwordText = passwordTextField.text else { return }
                userDefaults.set(usernameText, forKey: userKey)
                userDefaults.set(passwordText, forKey: passKey)
                userDefaults.set(signedIn, forKey: signedKey)
                performSegue(withIdentifier: "ShowHome", sender: nil)
            } else {
                if usernameTextField.text == choosenUsername && passwordTextField.text == choosenPassword {
                    performSegue(withIdentifier: "ShowHome", sender: nil)
                    //un: aleksandarlukic pass: Aleksandarlukic99
                } else {
                    loginAlerts(title: "Wrong username or password", message: "Enter your registered username and password")
                }
            }
        }
    }
    
    
    func isPasswordValid(password: String) -> Bool {
        let passRegex = "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z])[^\\s]{6,}$"
        let passwordTesting = NSPredicate(format: "SELF MATCHES %@", passRegex)
        return passwordTesting.evaluate(with: password)
    }
    
    func isUsernameValid(username: String) -> Bool {
        if username.count < 4 || username.contains(" ") {
            return false
        } else {
            return true
        }
    }
    
    func loginAlerts(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func loadingUser() {
        guard let storedUsername = userDefaults.value(forKey: userKey) as? String else { return }
        guard let storedPassword = userDefaults.value(forKey: passKey) as? String else { return }
        let userHasSingedIn = userDefaults.bool(forKey: signedKey)
        
        choosenUsername = storedUsername
        choosenPassword = storedPassword
        signedIn = userHasSingedIn
        
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
}

