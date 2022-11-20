//
//  SettingsViewController.swift
//  LetsChat
//
//  Created by aleksandar on 18.11.22..
//

import UIKit

class SettingsViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person.circle")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.textAlignment = .center
        label.textColor = .label
        
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.red, for: .normal)
        button.setTitle("Sign out", for: .normal)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Settings"
        view.backgroundColor = .systemBackground
        
        view.addSubview(button)
        view.addSubview(label)
        view.addSubview(imageView)
        
        label.text = ChatManager.shared.currentUser
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        addConstraints()
    }
    
    @objc func didTapButton() {
        ChatManager.shared.signOut()
        let vc = UINavigationController(rootViewController: LoginViewController())
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            label.rightAnchor.constraint(equalTo: view.rightAnchor),
            label.leftAnchor.constraint(equalTo: view.leftAnchor),
            label.heightAnchor.constraint(equalToConstant: 80),
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            button.rightAnchor.constraint(equalTo: view.rightAnchor),
            button.leftAnchor.constraint(equalTo: view.leftAnchor),
            button.heightAnchor.constraint(equalToConstant: 80),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50)
        ])
    }

}
