//
//  SignInCoordinator.swift
//  Optima
//
//  Created by Jose, Ann Catherine on 11/19/18.
//  Copyright © 2018 Optima. All rights reserved.
//

import UIKit

protocol SignInCoordinatorProtocol: Coordinator {
    func showHomeScreen()
}

/* 3 variations of the coordinator are implemented in this file:
    1. Single root view controller where the content of the root VC is changes
    2. Multiple root view controllers where the window's root VC is swapped
    3. Root view controller is a navigation controller and child VCs are pushed on to it
*/

// Type 1: This coordinator adds top level VCs as child of root VC, thus avoids swapping root VCs
class SignInCoordinator: SignInCoordinatorProtocol {
    
    private var signInViewController: SignInViewController
    
    private let rootViewController: RootViewController

    private let rootCoordinator: RootCoordinator
    
    init(rootViewController: RootViewController, rootCoordinator: RootCoordinator) {

        self.rootViewController = rootViewController
        self.rootCoordinator = rootCoordinator
        
        self.signInViewController = SignInViewController()
        print("Creating SignInCoordinator variant with single root view controller")
    }
    
    func start() {
        
        // Reset the SignInViewController and set its view model and ccordinator
        signInViewController = SignInViewController()

        signInViewController.viewModel = SignInViewModel()
        signInViewController.coordinator = self
        
        let signInNavigationController = UINavigationController(rootViewController: self.signInViewController)
        
        rootViewController.addChild(signInNavigationController)
        rootViewController.view.addSubview(signInNavigationController.view)
        signInNavigationController.didMove(toParent: rootViewController)
        signInNavigationController.view.frame = rootViewController.view.frame
        
        rootViewController.currentViewController.willMove(toParent: nil)
        rootViewController.currentViewController.view.removeFromSuperview()
        rootViewController.currentViewController.removeFromParent()
        
        rootViewController.currentViewController = signInNavigationController
    }
    
    func showHomeScreen() {
        // You can either create a new Home coordinator or ask the root coordinator to show Home screen
        // let homeCoordinator = HomeCoordinator(rootViewController: rootViewController)
        // homeCoordinator.start()
        rootCoordinator.showHomeScreen()
    }
}

// Type 2: This coordinator swaps the root view controller of the window
class SignInCoordinator_SwapWindowRootVC: SignInCoordinatorProtocol {
    
    private let signInViewController: SignInViewController
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.signInViewController = SignInViewController()
        
        self.window = window
        print("Creating SignInCoordinator variant with multiple swappable root view controller")
    }
    func start() {
        signInViewController.viewModel = SignInViewModel()
        signInViewController.coordinator = self
        
        let signInNavigationController = UINavigationController(rootViewController: signInViewController)
        window.rootViewController = signInNavigationController
    }
    
    func showHomeScreen() {
        let homeCoordinator = HomeCoordinator_SwapWindowRootVC(window: window)
        homeCoordinator.start()
    }
}

// Type 3: This coordinator pushes view controllers to the root navigation controller
class SignInCoordinator_NavRootVC: SignInCoordinatorProtocol {
    
    private let signInViewController: SignInViewController
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.signInViewController = SignInViewController()
        
        self.navigationController = navigationController
        print("Creating SignInCoordinator variant with navigable root view controller")
    }
    func start() {
        signInViewController.viewModel = SignInViewModel()
        signInViewController.coordinator = self
        
        navigationController.pushViewController(signInViewController, animated: true)
    }
    
    func showHomeScreen() {
        let homeCoordinator = HomeCoordinator_NavRootVC(navigationController: navigationController)
        homeCoordinator.start()
    }
}
