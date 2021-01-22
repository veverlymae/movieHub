//
//  ApplicationCoordinator+Navigation.swift
//  Movie Player
//
//  Created by Veverly Mae Ricaza Veverly on 1/20/21.
//  Copyright © 2021 Veverly Mae Ricaza. All rights reserved.
//

import UIKit

extension ApplicationCoordinator {
    
    func setupTopViewController() {
        let tabVC = TopViewController()
        
        let homeVC = HomeViewController()
        homeVC.tabBarItem.image = UIImage(named: "ic_home.png")
        homeVC.tabBarItem.title = "Home"
        
        let searchVC = SearchViewController()
        searchVC.tabBarItem.image = UIImage(named: "ic_search.png")
        searchVC.tabBarItem.title = "Search"

        tabVC.viewControllers = [homeVC, searchVC]
        let navVC = UINavigationController(rootViewController: tabVC)
        self.window.rootViewController = navVC
        self.window.makeKeyAndVisible()
    }
    
    func setupHomeViewController() {
        let homeVC = HomeViewController()
        let navVC = UINavigationController(rootViewController: homeVC)
        self.window.rootViewController = navVC
        self.window.makeKeyAndVisible()
    }
}
