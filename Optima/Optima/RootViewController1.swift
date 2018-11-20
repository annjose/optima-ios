//
//  RootViewController.swift
//  Optima
//
//  Created by Jose, Ann Catherine on 11/12/18.
//  Copyright © 2018 Optima. All rights reserved.
//

import UIKit

class RootViewController1: UIViewController {

    private var currentViewController: UIViewController!
    
    init() {
        currentViewController = SplashViewController()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.white
        
        showSplashScreen()
    }

    private func showSplashScreen() {
        let splashViewController = SplashViewController()
        
        addChild(splashViewController)
        splashViewController.view.frame = self.view.frame
        self.view.addSubview(splashViewController.view)
        splashViewController.didMove(toParent: self)
        
        currentViewController = splashViewController
    }
    
    func showSignInScreen() {
        
        let signInViewController = UINavigationController(rootViewController:  SignInViewController())
        
        addChild(signInViewController)
        self.view.addSubview(signInViewController.view)
        signInViewController.didMove(toParent: self)
        signInViewController.view.frame = self.view.frame

        currentViewController.willMove(toParent: nil)
        currentViewController.view.removeFromSuperview()
        currentViewController.removeFromParent()
        
        currentViewController = signInViewController
    }
    
    func showHomeScreen() {
        
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        
        addChild(homeViewController)
        self.view.addSubview(homeViewController.view)
        homeViewController.didMove(toParent: self)
        homeViewController.view.frame = self.view.frame

        currentViewController.willMove(toParent: nil)
        currentViewController.view.removeFromSuperview()
        currentViewController.removeFromParent()
        
        currentViewController = homeViewController
    }
}

