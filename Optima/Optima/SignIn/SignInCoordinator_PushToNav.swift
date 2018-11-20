//
//  SignInCoordinator_PushToNavController.swift
//  Optima
//
//  Created by Jose, Ann Catherine on 11/19/18.
//  Copyright © 2018 Optima. All rights reserved.
//

import UIKit

// This coordinator pushes view controllers to the root navigation controller
class SignInCoordinator_PushToNav: Coordinator {
    
    private let signInViewController: SignInViewController
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.signInViewController = SignInViewController()
        self.navigationController = navigationController
    }
    func start() {
        signInViewController.viewModel = SignInViewModel()
        // signInViewController.coordinator = self
        navigationController.pushViewController(signInViewController, animated: true)
    }
    
    func showHomeScreen() {
        //let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        //homeCoordinator.start()
    }
}
