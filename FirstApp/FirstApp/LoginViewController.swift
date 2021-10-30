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
    @IBOutlet private var registerButton: UIButton!
    
    let userDefaults = UserDefaults.standard
    
    var signedIn = false
    var choosenUsername = ""
    var choosenPassword = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        loadingUser()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if userDefaults.bool(forKey: UserDefaults.Keys.alreadyLog) == true {
            performSegue(withIdentifier: Constants.Identifiers.homeID, sender: self)
        }
    }
    
    //MARK: - Actions
    
    @IBAction func loginAction(_ sender: Any) {
        let passwordText = passwordTextField.text
        let usernameText = usernameTextField.text
        let trimmingPassword = passwordText?.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmingUsername = usernameText?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let myPassword = isPasswordValid(password: trimmingPassword ?? "")
        let myUsername = isValidUsername(username: trimmingUsername ?? "")
        
        if myPassword == false && myUsername == false {
            loginAlerts(title: Constants.Wrong.passAndUsernameTitle, message: Constants.Wrong.passAndUsernameMessage)
        } else if myPassword == false && myUsername == true {
            loginAlerts(title: Constants.Wrong.passTitle, message: Constants.Wrong.passMessage)
        } else if myPassword == true && myUsername == false {
            loginAlerts(title: Constants.Wrong.usernameTitle, message: Constants.Wrong.usernameMessage)
        } else {
            if signedIn == false {
                signedIn = true
                guard let usernameText = trimmingUsername, let passwordText = trimmingPassword else { return }
                userDefaults.set(usernameText, forKey: UserDefaults.Keys.userKey)
                userDefaults.set(passwordText, forKey: UserDefaults.Keys.passKey)
                userDefaults.set(signedIn, forKey: UserDefaults.Keys.signedKey)
                performSegue(withIdentifier: Constants.Identifiers.homeID, sender: nil)
            } else {
                if usernameTextField.text == choosenUsername && passwordTextField.text == choosenPassword {
                    userDefaults.set(true, forKey: UserDefaults.Keys.alreadyLog)
                    performSegue(withIdentifier: Constants.Identifiers.homeID, sender: nil)
                } else {
                    loginAlerts(title: Constants.Wrong.passOrUsernameTitle, message: Constants.Wrong.passOrUsernameMessage)
                }
            }
        }
    }
    
    @IBAction func switchToRegisterController(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyBoard.instantiateViewController(withIdentifier: Constants.Identifiers.registerScreenID) as! RegisterViewController
        destinationVC.modalPresentationStyle = .fullScreen
        present(destinationVC, animated: true, completion: nil)
    }
    
    func isPasswordValid(password: String) -> Bool {
        let passRegex = "^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$&*])(?=.*[A-Z])[^\\s]{6,}$"
        let passwordTesting = NSPredicate(format: "SELF MATCHES %@", passRegex)
        return passwordTesting.evaluate(with: password)
    }
    
    func isValidUsername(username: String) -> Bool {
        let usernameRegex = "^[a-zA-Z0-9]{4,}$"
        let usernameTesting = NSPredicate(format:"SELF MATCHES %@", usernameRegex)
        return usernameTesting.evaluate(with: username)
    }
    
    func loginAlerts(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: Constants.ok, style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func loadingUser() {
        guard let storedUsername = userDefaults.value(forKey: UserDefaults.Keys.userKey) as? String else { return }
        guard let storedPassword = userDefaults.value(forKey: UserDefaults.Keys.passKey) as? String else { return }
        let userHasSingedIn = userDefaults.bool(forKey: UserDefaults.Keys.signedKey)
        
        choosenUsername = storedUsername
        choosenPassword = storedPassword
        signedIn = userHasSingedIn
        
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
}

extension UserDefaults {
    
    enum Keys {
        static let passKey = "passwordKey"
        static let userKey = "usernameKey"
        static let signedKey = "signedInKey"
        static let alreadyLog = "alreadyLoggedInKey"
    }
    
}



