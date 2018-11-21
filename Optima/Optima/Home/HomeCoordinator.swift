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
    
    private var homeViewController: HomeViewController!
    
    private let rootViewController: RootViewController

    private let rootCoordinator: RootCoordinator
    
    init(rootViewController: RootViewController, rootCoordinator: RootCoordinator) {
        
        print("HomeCoordinator:init()")

        self.rootViewController = rootViewController
        self.rootCoordinator = rootCoordinator
        
        //self.homeViewController = HomeViewController()
    }
    
    deinit {
        print("HomeCoordinator:deinit()")
    }
    
    func start() {
        
        print("HomeCoordinator:start()")

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
    
    func stop() {
        print("HomeCoordinator:stop()")
        homeViewController.coordinator = nil
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
    private let rootCoordinator: RootCoordinator
    
    init(window: UIWindow, rootCoordinator: RootCoordinator) {
        print("HomeCoordinator:init()")
        
        self.window = window
        self.rootCoordinator = rootCoordinator

        self.homeViewController = HomeViewController()
    }
    
    deinit {
        print("HomeCoordinator:deinit()")
    }
    
    func start() {
        print("HomeCoordinator:start()")

        homeViewController.viewModel = HomeViewModel()
        homeViewController.coordinator = self

        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        window.rootViewController = homeNavigationController
    }
    
    func stop() {
        print("HomeCoordinator:stop()")
        homeViewController.coordinator = nil
    }
    
    func showSignInScreen() {
        // let signInCoordinator = SignInCoordinator_SwapWindowRootVC(window: window)
        // signInCoordinator.start()
        rootCoordinator.showSignInScreen()
    }
}

// Type 3: This coordinator pushes view controllers to the root navigation controller
class HomeCoordinator_NavRootVC: HomeCoordinatorProtocol {
    
    let homeViewController: HomeViewController
    
    private let navigationController: UINavigationController
    private let rootCoordinator: RootCoordinator

    init(navigationController: UINavigationController, rootCoordinator: RootCoordinator) {
        print("HomeCoordinator:init()")

        self.navigationController = navigationController
        self.rootCoordinator = rootCoordinator

        self.homeViewController = HomeViewController()
    }
    
    deinit {
        print("HomeCoordinator:deinit()")
    }
    
    func start() {
        print("HomeCoordinator:start()")

        homeViewController.viewModel = HomeViewModel()
        homeViewController.coordinator = self

        navigationController.pushViewController(homeViewController, animated: true)
    }
    
    func stop() {
        print("HomeCoordinator:stop()")
        
        homeViewController.coordinator = nil
        
        // If you pop the current view controller, it creates a UI glitch of VC coming in and out
        //navigationController.popViewController(animated: false)
    }
    
    func showSignInScreen() {
        //let signInCoordinator = SignInCoordinator_NavRootVC(navigationController: parentNavigationController)
        //signInCoordinator.start()
        rootCoordinator.showSignInScreen()
    }
}
