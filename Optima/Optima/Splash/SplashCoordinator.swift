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
        
        print("SplashCoordinator:init()")

        self.rootViewController = rootViewController
        self.rootCoordinator = rootCoordinator
        
        self.splashViewController = SplashViewController()
    }
    
    deinit {
        print("SplashCoordinator:deinit()")
    }
    
    func start() {
        
        print("SplashCoordinator:start()")

        splashViewController.coordinator = self
        
        rootViewController.addChild(splashViewController)
        splashViewController.view.frame = rootViewController.view.frame
        rootViewController.view.addSubview(splashViewController.view)
        splashViewController.didMove(toParent: rootViewController)
        
        rootViewController.currentChildViewController = splashViewController
    }
    
    func stop() {
        print("SplashCoordinator:stop()")
        splashViewController.coordinator = nil
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
    
    private let rootCoordinator: RootCoordinator
    
    init(window: UIWindow, rootCoordinator: RootCoordinator) {
        print("SplashCoordinator:init()")
        
        self.window = window
        self.rootCoordinator = rootCoordinator
        
        self.splashViewController = SplashViewController()
    }
    
    deinit {
        print("SplashCoordinator:deinit()")
    }
    
    func start() {
        print("SplashCoordinator:start()")

        splashViewController.coordinator = self
        
        // swap the root view controller to the splash view controller
        window.rootViewController = splashViewController
    }
    
    func stop() {
        print("SplashCoordinator:stop()")
        splashViewController.coordinator = nil
    }

    func showSignInScreen() {
        // let signInCoordinator = SignInCoordinator_SwapWindowRootVC(window: window)
        // signInCoordinator.start()
        rootCoordinator.showSignInScreen()
    }
    func showHomeScreen() {
        // let homeCoordinator = HomeCoordinator_SwapWindowRootVC(window: window)
        // homeCoordinator.start()
        rootCoordinator.showHomeScreen()
    }
}

// Type 3: This coordinator pushes view controllers to the root navigation controller
class SplashCoordinator_NavRootVC: SplashCoordinatorProtocol {
    
    private let splashViewController: SplashViewController
    
    private var navigationController: UINavigationController
    
    private let rootCoordinator: RootCoordinator

    init(navigationController: UINavigationController, rootCoordinator: RootCoordinator) {
        print("SplashCoordinator:init()")
        
        self.navigationController = navigationController
        self.rootCoordinator = rootCoordinator
        
        self.splashViewController = SplashViewController()
    }
    
    deinit {
        print("SplashCoordinator:deinit()")
    }
    
    func start() {
        print("SplashCoordinator:start()")

        splashViewController.coordinator = self
        
        navigationController.pushViewController(splashViewController, animated: true)
    }
    
    func stop() {
        print("SplashCoordinator:stop()")
        
        splashViewController.coordinator = nil
        //navigationController.popViewController(animated: true)
    }
    
    func showSignInScreen() {
        // let signInCoordinator = SignInCoordinator_NavRootVC(navigationController: parentNavigationController)
        // signInCoordinator.start()
        rootCoordinator.showSignInScreen()
    }
    func showHomeScreen() {
        // let homeCoordinator = HomeCoordinator_NavRootVC(navigationController: parentNavigationController)
        // homeCoordinator.start()
        rootCoordinator.showHomeScreen()
    }
}
