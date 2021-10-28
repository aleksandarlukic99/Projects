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
    }
    
    //MARK: - Actions
    
    @IBAction func backToLoginScreenAction(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: UserDefaults.Keys.alreadyLog)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyBoard.instantiateViewController(withIdentifier: Constants.Identifiers.loginScreenID) as! LoginViewController
        destinationVC.modalPresentationStyle = .fullScreen
        present(destinationVC, animated: true, completion: nil)
    }
    
}
