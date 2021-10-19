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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let myPassword = isPasswordValid(password: passwordTextField.text!)
        let myUsername = isUsernameValid(username: usernameTextField.text!)
        if myPassword == false && myUsername == false {
            let alert = UIAlertController(title: "Wrong password and username", message: "Username must have at least 4 characters. Password must contain at least 6 characters, 1 uppercase letter, 1 number and no space.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        } else if myPassword == false && myUsername == true {
            let alert = UIAlertController(title: "Wrong password", message: "Password must contain at least 6 characters, 1 uppercase letter, 1 number and no space.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        } else if myPassword == true && myUsername == false {
            let alert = UIAlertController(title: "Wrong username", message: "Username must have at least 4 characters and no space.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: "ShowHome", sender: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
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

}

extension LoginViewController: UITextFieldDelegate {
    
}
