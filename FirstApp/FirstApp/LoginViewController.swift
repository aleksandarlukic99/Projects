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
    
    var choosenUsername = "adminIsBestUserHereYouWillNeverKnowThisUsername"
    var choosenPassword = "1F8cc6299IccY!!#$?26"
    
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
        let usernameText = usernameTextField.text
        let passwordText = passwordTextField.text
        let usernameTrimmed = usernameText?.trimmingCharacters(in: .whitespacesAndNewlines)
        let passwordTrimmed = passwordText?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if usernameTrimmed == choosenUsername && passwordTrimmed == choosenPassword {
            userDefaults.set(true, forKey: UserDefaults.Keys.alreadyLog)
            performSegue(withIdentifier: Constants.Identifiers.homeID, sender: nil)
        } else {
            loginAlerts(title: Constants.Wrong.passOrUsernameTitle, message: Constants.Wrong.passOrUsernameMessage)
            
        }
    }
    
    @IBAction func switchToRegisterController(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyBoard.instantiateViewController(withIdentifier: Constants.Identifiers.registerScreenID) as! RegisterViewController
        destinationVC.modalPresentationStyle = .fullScreen
        present(destinationVC, animated: true, completion: nil)
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
        
        choosenUsername = storedUsername
        choosenPassword = storedPassword
        
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
}

extension UserDefaults {
    
    enum Keys {
        static let passKey = "passwordKey"
        static let userKey = "usernameKey"
        static let alreadyLog = "alreadyLoggedInKey"
    }
    
}



