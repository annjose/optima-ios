//
//  HomeCoordinator.swift
//  Optima
//
//  Created by Jose, Ann Catherine on 11/19/18.
//  Copyright © 2018 Optima. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    let window: UIWindow
    let homeViewController: HomeViewController
    let homeNavigationController: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        self.homeViewController = HomeViewController()
        self.homeNavigationController = UINavigationController(rootViewController: self.homeViewController)
    }
    
    func start() {
        homeViewController.viewModel = HomeViewModel()
        homeViewController.coordinator = self
        
        window.rootViewController = homeNavigationController
    }
    
    func showSignInScreen() {
        let signInCoordinator = SignInCoordinator(window: window)
        signInCoordinator.start()
    }
}
