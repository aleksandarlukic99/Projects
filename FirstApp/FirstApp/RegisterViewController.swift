//
//  RegisterViewController.swift
//  FirstApp
//
//  Created by aleksandar on 28.10.21..
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet private var firstNameTextField: UITextField!
    @IBOutlet private var lastNameTextField: UITextField!
    @IBOutlet private var usernameTextField: UITextField!
    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var confirmPasswordTextField: UITextField!
    @IBOutlet private var birthdayDatePicker: UIDatePicker!
    @IBOutlet private var genderSegmentedControl: UISegmentedControl!
    @IBOutlet private var registerButton: UIButton!
    @IBOutlet private var privacyPolicyTextView: UITextView!
    @IBOutlet private var backToLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        usernameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        passwordTextField.autocorrectionType = .no
        confirmPasswordTextField.autocorrectionType = .no
        updateTextView()
    }
    
    //MARK: - Actions
    
    @IBAction func backToLoginScreenAction(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: UserDefaults.Keys.alreadyLog)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyBoard.instantiateViewController(withIdentifier: Constants.Identifiers.loginScreenID) as! LoginViewController
        destinationVC.modalPresentationStyle = .fullScreen
        present(destinationVC, animated: true, completion: nil)
    }
    
    //MARK: - Methods
    
    func updateTextView () {
        let path = "https://en.wikipedia.org/wiki/Privacy_policy"
        let text = privacyPolicyTextView.text ?? ""
        let attributedString = NSAttributedString.makeHyperlink(for: path, in: text, as: "Privacy policy")
        let font = privacyPolicyTextView.font
        privacyPolicyTextView.attributedText = attributedString
        privacyPolicyTextView.font = font
        privacyPolicyTextView.textAlignment = .center
    }
    
    func loginAlerts(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: Constants.ok, style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func isPasswordValid(password: String) -> Bool {
        let passRegex = "^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$&*])(?=.*[A-Z])[^\\s]{6,}$"
        let passwordTesting = NSPredicate(format: "SELF MATCHES %@", passRegex)
        return passwordTesting.evaluate(with: password)
    }
    
    func isEmailValid(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        let emailTesting = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailTesting.evaluate(with: email)
    }
    
    func isValidFirstAndLastName(names: String) -> Bool {
        guard names.count > 2 else { return false }
        let nameRegex = "^(([^ ]?)(^[a-zA-Z].*[a-zA-Z]$)([^ ]?))$"
        let predicateTesting = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        return predicateTesting.evaluate(with: names)
    }
    
    func isValidUsername(username: String) -> Bool {
        let usernameRegex = "^[a-zA-Z0-9]{4,}$"
        let usernameTesting = NSPredicate(format:"SELF MATCHES %@", usernameRegex)
        return usernameTesting.evaluate(with: username)
    }
    
    func validateAge(birthDate: Date) -> Bool {
        let maximumAge: Date = Calendar.current.date(byAdding: .year, value: -100, to: Date())!
        let minimumAge: Date = Calendar.current.date(byAdding: .year, value: -18, to: Date())!
        
        var isValid: Bool = true
        
        if birthDate < maximumAge || birthDate > minimumAge {
            isValid = false
        }
        
        return isValid
    }
    
}

extension RegisterViewController: UITextFieldDelegate {
    
}
