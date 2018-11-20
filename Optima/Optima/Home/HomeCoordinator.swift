//
//  HomeCoordinator.swift
//  Optima
//
//  Created by Jose, Ann Catherine on 11/19/18.
//  Copyright © 2018 Optima. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    let homeViewController: HomeViewController
    let homeNavigationController: UINavigationController
    
    private let rootViewController: RootViewController

    init(rootViewController: RootViewController) {
        self.rootViewController = rootViewController
        self.homeViewController = HomeViewController()
        self.homeNavigationController = UINavigationController(rootViewController: self.homeViewController)
    }
        
    func start() {
        homeViewController.viewModel = HomeViewModel()
        homeViewController.coordinator = self
        
        rootViewController.addChild(homeNavigationController)
        rootViewController.view.addSubview(homeNavigationController.view)
        homeNavigationController.didMove(toParent: rootViewController)
        homeNavigationController.view.frame = rootViewController.view.frame
        
        rootViewController.currentViewController.willMove(toParent: nil)
        rootViewController.currentViewController.view.removeFromSuperview()
        rootViewController.currentViewController.removeFromParent()
        
        rootViewController.currentViewController = homeNavigationController
    }
    
    func showSignInScreen() {
        let signInCoordinator = SignInCoordinator(rootViewController: rootViewController)
        signInCoordinator.start()
    }
}
