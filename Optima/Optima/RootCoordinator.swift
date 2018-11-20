//
//  RootCoordinator.swift
//  Optima
//
//  Created by Jose, Ann Catherine on 11/19/18.
//  Copyright © 2018 Optima. All rights reserved.
//

import Foundation
import UIKit

class RootCoordinator: Coordinator {
    
    private let window: UIWindow
    
    private let rootViewController: RootViewController
    
    //private let navigationController: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        self.rootViewController = RootViewController()
        //self.navigationController = UINavigationController(rootViewController: rootViewController)
    }
    
    func start() {
        self.rootViewController.coordinator = self
        window.rootViewController = self.rootViewController
        //window.rootViewController = self.navigationController
    }
    
    func showSplashScreen() {
        let splashViewController = SplashViewController()
        splashViewController.coordinator = self
        // navigationController.pushViewController(splashViewController, animated: true)
    }
    
    func showHomeScreen() {
        
        let homeCoordinator = HomeCoordinator(rootViewController: rootViewController)
        homeCoordinator.start()
    }
    
    func showSignInScreen() {
        let signInCoordinator = SignInCoordinator(rootViewController: rootViewController)
        signInCoordinator.start()
    }

}


