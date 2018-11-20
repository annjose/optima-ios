//
//  HomeCoordinator.swift
//  Optima
//
//  Created by Jose, Ann Catherine on 11/19/18.
//  Copyright © 2018 Optima. All rights reserved.
//

import UIKit

protocol HomeCoordinatorProtocol: Coordinator {
    func showSignInScreen()
}

/* 3 variations of the coordinator are implemented in this file:
 1. Single root view controller where the content of the root VC is changes
 2. Multiple root view controllers where the window's root VC is swapped
 3. Root view controller is a navigation controller and child VCs are pushed on to it
 */

// Type 1: This coordinator adds top level VCs as child of root VC, thus avoids swapping root VCs
class HomeCoordinator: HomeCoordinatorProtocol {
    
    private var homeViewController: HomeViewController
    
    private let rootViewController: RootViewController

    private let rootCoordinator: RootCoordinator
    
    init(rootViewController: RootViewController, rootCoordinator: RootCoordinator) {
        
        self.rootViewController = rootViewController
        self.rootCoordinator = rootCoordinator
        
        self.homeViewController = HomeViewController()

        print("Creating HomeCoordinator variant with single root view controller")
    }
    
    deinit {
        print("HomeCoordinator:deinit()")
    }
    
    func start() {
        
        // Reset the HomeViewController and set its view model and ccordinator
        homeViewController = HomeViewController()

        homeViewController.viewModel = HomeViewModel()
        homeViewController.coordinator = self

        let homeNavigationController = UINavigationController(rootViewController: self.homeViewController)
        
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
        // let signInCoordinator = SignInCoordinator(rootViewController: rootViewController)
        // signInCoordinator.start()
        rootCoordinator.showSignInScreen()
    }
}


// Type 2: This coordinator swaps the root view controller of the window
class HomeCoordinator_SwapWindowRootVC: HomeCoordinatorProtocol {
    
    let homeViewController: HomeViewController

    private let window: UIWindow
    
    init(window: UIWindow) {
        self.homeViewController = HomeViewController()
        
        self.window = window
        print("Creating HomeCoordinator variant with multiple swappable root view controller")
    }
    func start() {
        homeViewController.viewModel = HomeViewModel()
        homeViewController.coordinator = self

        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        window.rootViewController = homeNavigationController
    }
    
    func showSignInScreen() {
        let signInCoordinator = SignInCoordinator_SwapWindowRootVC(window: window)
        signInCoordinator.start()
    }
}

// Type 3: This coordinator pushes view controllers to the root navigation controller
class HomeCoordinator_NavRootVC: HomeCoordinatorProtocol {
    
    let homeViewController: HomeViewController
    private let parentNavigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.homeViewController = HomeViewController()

        self.parentNavigationController = navigationController
        print("Creating HomeCoordinator variant with navigable root view controller")
    }
    func start() {
        homeViewController.viewModel = HomeViewModel()
        homeViewController.coordinator = self

        parentNavigationController.pushViewController(homeViewController, animated: true)
    }
    
    func showSignInScreen() {
        let signInCoordinator = SignInCoordinator_NavRootVC(navigationController: parentNavigationController)
        signInCoordinator.start()
    }
}
