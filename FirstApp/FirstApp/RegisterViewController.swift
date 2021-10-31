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
    @IBOutlet private var showPasswordButton: UIButton!
    @IBOutlet private var showPasswordConfirmButton: UIButton!
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        usernameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        [firstNameTextField, lastNameTextField, usernameTextField, emailTextField, passwordTextField, confirmPasswordTextField].forEach({ $0.addTarget(self, action: #selector(editingChanged), for: .editingChanged) })
        passwordTextField.autocorrectionType = .no
        confirmPasswordTextField.autocorrectionType = .no
        updateTextView()
        showPasswordButton.addTarget(self, action: #selector(passwordButtonDown), for: .touchDown)
        showPasswordButton.addTarget(self, action: #selector(passwordButtonUp), for: [.touchUpInside, .touchUpOutside])
        showPasswordConfirmButton.addTarget(self, action: #selector(confirmPasswordButtonDown), for: .touchDown)
        showPasswordConfirmButton.addTarget(self, action: #selector(confirmPasswordButtonUp), for: [.touchUpInside, .touchUpOutside])
    }
    
    //MARK: - Actions
    
    @IBAction func backToLoginScreenAction(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: UserDefaults.Keys.alreadyLog)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyBoard.instantiateViewController(withIdentifier: Constants.Identifiers.loginScreenID) as! LoginViewController
        destinationVC.modalPresentationStyle = .fullScreen
        present(destinationVC, animated: true, completion: nil)
    }
    
    @IBAction func registerAction(_ sender: Any) {
        let firstNameText = firstNameTextField.text
        let lastNameText = lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let usernameText = usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let emailText = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let passwordText = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let passwordConfirmText = confirmPasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let firstNameTrimmed = firstNameText?.trimmingCharacters(in: .whitespacesAndNewlines)
        let lastNameTrimmed = lastNameText?.trimmingCharacters(in: .whitespacesAndNewlines)
        let usernameTrimmed = usernameText?.trimmingCharacters(in: .whitespacesAndNewlines)
        let emailTrimmed = emailText?.trimmingCharacters(in: .whitespacesAndNewlines)
        let passwordTrimmed = passwordText?.trimmingCharacters(in: .whitespacesAndNewlines)
        let confirmPasswordTrimmed = passwordConfirmText?.trimmingCharacters(in: .whitespacesAndNewlines)
        let firstName = isValidFirstAndLastName(names: firstNameTrimmed ?? "")
        let lastName = isValidFirstAndLastName(names: lastNameTrimmed ?? "")
        let username = isValidUsername(username: usernameTrimmed ?? "")
        let email = isEmailValid(email: emailTrimmed ?? "")
        let password = isPasswordValid(password: passwordTrimmed ?? "")
        let passwordConfirm = isPasswordValid(password: confirmPasswordTrimmed ?? "")
        let birthday = validateAge(birthDate: birthdayDatePicker.date)
        
        if firstName == true && lastName == true && username == true && email == true && password == true && passwordConfirm == password && birthday == true {
            guard let usernameText = usernameTrimmed, let passwordText = passwordTrimmed else { return }
            userDefaults.set(usernameText, forKey: UserDefaults.Keys.userKey)
            userDefaults.set(passwordText, forKey: UserDefaults.Keys.passKey)
            performSegue(withIdentifier: Constants.Identifiers.homePlayersID, sender: nil)
        } else {
            loginAlerts(title: Constants.Wrong.inputsTitle, message: Constants.Wrong.inputsMessage)
        }
        
    }
    
    @IBAction func genderChooseAction(_ sender: Any) {
        if genderSegmentedControl.selectedSegmentIndex == 0 {
            print("male")
        } else if genderSegmentedControl.selectedSegmentIndex == 1 {
            print("Female")
        }
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
    
    @objc func editingChanged(_ textField: UITextField) {
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
        }
        guard
            let firstName = firstNameTextField.text, !firstName.isEmpty,
            let lastName = lastNameTextField.text, !lastName.isEmpty,
            let username = usernameTextField.text, !username.isEmpty,
            let email = emailTextField.text, !email.isEmpty,
            let password = passwordTextField.text, !password.isEmpty,
            let confirmPassword = confirmPasswordTextField.text, !confirmPassword.isEmpty
        else {
            registerButton.isEnabled = false
            return
        }
        registerButton.isEnabled = true
    }
    
    @objc func passwordButtonDown(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry = false
    }
    
    @objc func confirmPasswordButtonDown(_ sender: UIButton) {
        confirmPasswordTextField.isSecureTextEntry = false
    }
    
    @objc func passwordButtonUp(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry = true
    }
    
    @objc func confirmPasswordButtonUp(_ sender: UIButton) {
        confirmPasswordTextField.isSecureTextEntry = true
    }
    
    //MARK: - Validations
    
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
        let nameRegex = "^[A-Z][a-z]*$"
        let predicateTesting = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        return predicateTesting.evaluate(with: names)
    }
    
    func isValidUsername(username: String) -> Bool {
        let usernameRegex = "^[a-zA-Z0-9]{4,}$"
        let usernameTesting = NSPredicate(format:"SELF MATCHES %@", usernameRegex)
        return usernameTesting.evaluate(with: username)
    }
    
    func validateAge(birthDate: Date) -> Bool {
        let maximumAge: Date = Calendar.current.date(byAdding: .year, value: -120, to: Date())!
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
