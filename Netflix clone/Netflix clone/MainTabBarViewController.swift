//
//  ViewController.swift
//  Netflix clone
//
//  Created by aleksandar on 7.10.22..
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBrown
        
        let viewController1 = UINavigationController(rootViewController: HomeViewController())
        let viewController2 = UINavigationController(rootViewController: UpcomingViewController())
        let viewController3 = UINavigationController(rootViewController: SearchViewController())
        let viewController4 = UINavigationController(rootViewController: DownloadViewController())
        
        viewController1.tabBarItem.image = UIImage(systemName: "house")
        viewController2.tabBarItem.image = UIImage(systemName: "play.circle")
        viewController3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        viewController4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        viewController1.title = "Home"
        viewController2.title = "Comming soon"
        viewController3.title = "Top searches"
        viewController4.title = "Downloads"
        
        tabBar.tintColor = .label
        
        setViewControllers([viewController1 ,viewController2, viewController3, viewController4], animated: true)
    }
    
}

