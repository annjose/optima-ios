//
//  SignInCoordinator.swift
//  Optima
//
//  Created by Jose, Ann Catherine on 11/19/18.
//  Copyright © 2018 Optima. All rights reserved.
//

import UIKit

// This coordinator adds top level VCs as child of root VC, thus avoids swapping root VCs
class SignInCoordinator: Coordinator {
    
    private let signInViewController: SignInViewController
    private var signInNavigationController: UINavigationController?
    
    private let rootViewController: RootViewController
    
    init(rootViewController: RootViewController) {
        self.rootViewController = rootViewController
        self.signInViewController = SignInViewController()

    }
    
    func start() {
        signInViewController.viewModel = SignInViewModel()
        signInViewController.coordinator = self
        
        self.signInNavigationController = UINavigationController(rootViewController: self.signInViewController)
        rootViewController.addChild(signInNavigationController!)
        rootViewController.view.addSubview(signInNavigationController!.view)
        signInNavigationController!.didMove(toParent: rootViewController)
        signInNavigationController!.view.frame = rootViewController.view.frame
        
        rootViewController.currentViewController.willMove(toParent: nil)
        rootViewController.currentViewController.view.removeFromSuperview()
        rootViewController.currentViewController.removeFromParent()
        
        rootViewController.currentViewController = signInNavigationController
    }
    
    func showHomeScreen() {
        let homeCoordinator = HomeCoordinator(rootViewController: rootViewController)
        homeCoordinator.start()
    }
}
