//
//  RootCoordinator.swift
//  Optima
//
//  Created by Jose, Ann Catherine on 11/19/18.
//  Copyright © 2018 Optima. All rights reserved.
//

import Foundation
import UIKit

enum RootViewCoordinationStrategy {
    case singleRootViewController    // The best approach
    case multipleRootViewControllers
    case navigableRootViewController
}

/* 3 variations of the coordinator are implemented in this sample:
 Type 1. Single root view controller where the content of the root VC is changes
 Type 2. Multiple root view controllers where the window's root VC is swapped
 Type 3. Root view controller is a navigation controller and child VCs are pushed on to it
 */
class RootCoordinator: Coordinator {
    
    private let window: UIWindow
    
    private let coordinationStrategy: RootViewCoordinationStrategy

    private let rootViewController: RootViewController
    
    private var rootNavigationController: UINavigationController?
    
    init(window: UIWindow, coordinationStrategy: RootViewCoordinationStrategy) {
        self.window = window
        self.coordinationStrategy = coordinationStrategy
        self.rootViewController = RootViewController()
    }
    
    func start() {
        self.rootViewController.coordinator = self
        window.rootViewController = self.rootViewController
        
        if coordinationStrategy == .navigableRootViewController {
            self.rootNavigationController = UINavigationController(rootViewController: rootViewController)
            window.rootViewController = self.rootNavigationController
        }
        
        showSplashScreen()
    }
    
    func showSplashScreen() {
        
        guard let splashCoordinator = createSplashCoordinator(coordinationStrategy: coordinationStrategy) else {
            print("ERROR splashCoordinator is nil; cannot show Splash screen")
            return
        }
        splashCoordinator.start()
    }
    
    func showSignInScreen() {
        guard let signInCoordinator = createSignInCoordinator(coordinationStrategy: coordinationStrategy) else {
            print("ERROR signInCoordinator is nil; cannot show SignIn screen")
            return
        }
        signInCoordinator.start()
    }

    func showHomeScreen() {
        guard let homeCoordinator = createHomeCoordinator(coordinationStrategy: coordinationStrategy) else {
            print("ERROR homeCoordinator is nil; cannot show Home screen")
            return
        }
        homeCoordinator.start()
    }

    // Helper functions to create a Coordinator depending on the coordination strategy
    //  Ideally this can be moved to a factory class; but we are not doing it here because in a real application,
    //  all 3 of them will not co-exist, so there is no need to swap them out at runtime.
    private func createSplashCoordinator(coordinationStrategy: RootViewCoordinationStrategy) -> SplashCoordinatorProtocol? {
        
        switch coordinationStrategy {
            
        case .singleRootViewController:
            let coordinator = SplashCoordinator(rootViewController: rootViewController)
            return coordinator
            
        case .multipleRootViewControllers:
            let coordinator = SplashCoordinator_SwapWindowRootVC(window: window)
            return coordinator
            
        case .navigableRootViewController:
            guard let rootNavigationController = rootNavigationController else {
                print("rootNavigationController is nil; cannot create Splash coordinator")
                return nil
            }
            
            let coordinator = SplashCoordinator_NavRootVC(navigationController: rootNavigationController)
            return coordinator
        }
    }
    
    private func createSignInCoordinator(coordinationStrategy: RootViewCoordinationStrategy) -> SignInCoordinatorProtocol? {
        
        switch coordinationStrategy {
            
        case .singleRootViewController:
            let coordinator = SignInCoordinator(rootViewController: rootViewController)
            return coordinator
            
        case .multipleRootViewControllers:
            let coordinator = SignInCoordinator_SwapWindowRootVC(window: window)
            return coordinator
            
        case .navigableRootViewController:
            guard let rootNavigationController = rootNavigationController else {
                print("rootNavigationController is nil; cannot create SignIn coordinator")
                return nil
            }
            
            let coordinator = SignInCoordinator_NavRootVC(navigationController: rootNavigationController)
            return coordinator
        }
    }
    
    private func createHomeCoordinator(coordinationStrategy: RootViewCoordinationStrategy) -> HomeCoordinatorProtocol? {
        
        switch coordinationStrategy {
            
        case .singleRootViewController:
            let coordinator = HomeCoordinator(rootViewController: rootViewController)
            return coordinator
            
        case .multipleRootViewControllers:
            let coordinator = HomeCoordinator_SwapWindowRootVC(window: window)
            return coordinator
            
        case .navigableRootViewController:
            guard let rootNavigationController = rootNavigationController else {
                print("rootNavigationController is nil; cannot create Home coordinator")
                return nil
            }
            
            let coordinator = HomeCoordinator_NavRootVC(navigationController: rootNavigationController)
            return coordinator
        }
    }
}
