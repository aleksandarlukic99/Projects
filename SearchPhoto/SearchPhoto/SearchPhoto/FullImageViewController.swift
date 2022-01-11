//
//  FullImageViewController.swift
//  SearchPhoto
//
//  Created by aleksandar on 28.12.21..
//

import UIKit

class FullImageViewController: UIViewController {

    @IBOutlet private weak var fullImageView: UIImageView!
    @IBOutlet private weak var likeLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var backBarButton: UIBarButtonItem!
    @IBOutlet private weak var navigationBar: UINavigationBar!
    
    var results: Results!
    var downloadTask: URLSessionDownloadTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.borderColor = UIColor.label.cgColor
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        updateUI()
    }
    
    //MARK: - Actions
    
    @IBAction func didTapBackBarButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    //MARK: - Methods
    
    func updateUI() {
        navigationBar.topItem?.title = "\(results.user.name) post"
        likeLabel.text = "\(results.likes) people like this"
        descriptionLabel.text = "\(results.user.username): \(results.alt_description)"
        usernameLabel.text = results.user.username
        
        //get images
        if let largeURL = URL(string: results.urls.full) {
            downloadTask = fullImageView.loadImage(url: largeURL)
        }
        if let profileURL = URL(string: results.user.profile_image.medium) {
            downloadTask = profileImageView.loadImage(url: profileURL)
        }
        
    }
    
    
}
