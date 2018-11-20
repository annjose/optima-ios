//
//  SignInViewController.swift
//  Optima
//
//  Created by Jose, Ann Catherine on 11/19/18.
//  Copyright © 2018 Optima. All rights reserved.
//

import UIKit

// This coordinator swaps the root view controller of the window
class SignInCoordinator_SwapRootVC: Coordinator {
    
    let window: UIWindow
    
    private let signInViewController: SignInViewController
    private let signInNavigationController: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        self.signInViewController = SignInViewController()
        self.signInNavigationController = UINavigationController(rootViewController: self.signInViewController)
    }
    func start() {
        signInViewController.viewModel = SignInViewModel()
        // signInViewController.coordinator = self
        
        window.rootViewController = signInNavigationController
    }
    
    func showHomeScreen() {
        // let homeCoordinator = HomeCoordinator(window: window)
        // homeCoordinator.start()
    }
}
