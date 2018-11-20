//
//  SplashCoordinator.swift
//  Optima
//
//  Created by Jose, Ann Catherine on 11/20/18.
//  Copyright © 2018 Optima. All rights reserved.
//

import UIKit

protocol SplashCoordinatorProtocol: Coordinator {
    func showSignInScreen()
    func showHomeScreen()
}

/* 3 variations of the coordinator are implemented in this file:
 Type 1. Single root view controller where the content of the root VC is changes
 Type 2. Multiple root view controllers where the window's root VC is swapped
 Type 3. Root view controller is a navigation controller and child VCs are pushed on to it
 */

// Type 1: This coordinator adds top level VCs as child of root VC, thus avoids swapping root VCs
class SplashCoordinator: SplashCoordinatorProtocol {
    
    private let splashViewController: SplashViewController
    
    private let rootViewController: RootViewController
    
    private let rootCoordinator: RootCoordinator

    init(rootViewController: RootViewController, rootCoordinator: RootCoordinator) {
        self.rootViewController = rootViewController
        self.rootCoordinator = rootCoordinator
        
        self.splashViewController = SplashViewController()
        print("Creating SplashCoordinator variant with single root view controller")
    }
    
    func start() {
        
        splashViewController.coordinator = self
        
        rootViewController.addChild(splashViewController)
        splashViewController.view.frame = rootViewController.view.frame
        rootViewController.view.addSubview(splashViewController.view)
        splashViewController.didMove(toParent: rootViewController)
        
        rootViewController.currentViewController = splashViewController
    }
    
    func showSignInScreen() {
        // let signInCoordinator = SignInCoordinator(rootViewController: rootViewController)
        // signInCoordinator.start()
        rootCoordinator.showSignInScreen()
    }
    func showHomeScreen() {
        // let homeCoordinator = HomeCoordinator(rootViewController: rootViewController)
        // homeCoordinator.start()
        rootCoordinator.showHomeScreen()
    }
}

// Type 2: This coordinator swaps the root view controller of the window
class SplashCoordinator_SwapWindowRootVC: SplashCoordinatorProtocol {
    
    private let splashViewController: SplashViewController
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.splashViewController = SplashViewController()
        
        self.window = window
        print("Creating SplashCoordinator variant with multiple swappable root view controller")
    }
    
    func start() {
        
        splashViewController.coordinator = self
        
        // swap the root view controller to the splash view controller
        window.rootViewController = splashViewController
    }
    
    func showSignInScreen() {
        let signInCoordinator = SignInCoordinator_SwapWindowRootVC(window: window)
        signInCoordinator.start()
    }
    func showHomeScreen() {
        let homeCoordinator = HomeCoordinator_SwapWindowRootVC(window: window)
        homeCoordinator.start()
    }
}

// Type 3: This coordinator pushes view controllers to the root navigation controller
class SplashCoordinator_NavRootVC: SplashCoordinatorProtocol {
    
    private let splashViewController: SplashViewController
    
    private var parentNavigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.splashViewController = SplashViewController()
        
        self.parentNavigationController = navigationController
        print("Creating SplashCoordinator variant with navigable root view controller")
    }
    
    func start() {
        
        splashViewController.coordinator = self
        
        parentNavigationController.pushViewController(splashViewController, animated: true)
        
    }
    
    func showSignInScreen() {
        let signInCoordinator = SignInCoordinator_NavRootVC(navigationController: parentNavigationController)
        signInCoordinator.start()
    }
    func showHomeScreen() {
        let homeCoordinator = HomeCoordinator_NavRootVC(navigationController: parentNavigationController)
        homeCoordinator.start()
    }
}
