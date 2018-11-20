//
//  RootViewController.swift
//  Optima
//
//  Created by Jose, Ann Catherine on 11/19/18.
//  Copyright © 2018 Optima. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    var currentViewController: UIViewController!

    private let activityIndicator = UIActivityIndicatorView(style: .white)

    weak var coordinator: RootCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        showSplashScreen()
    }
    
    private func showSplashScreen() {
        let splashViewController = SplashViewController()
        splashViewController.coordinator = coordinator
        
        addChild(splashViewController)
        splashViewController.view.frame = self.view.frame
        self.view.addSubview(splashViewController.view)
        splashViewController.didMove(toParent: self)
        
        currentViewController = splashViewController
    }
    
}
