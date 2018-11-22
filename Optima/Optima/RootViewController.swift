//
//  RootViewController.swift
//  Optima
//
//  Created by Jose, Ann Catherine on 11/19/18.
//  Copyright © 2018 Optima. All rights reserved.
//

import UIKit

class SingleChildContainerViewController: UIViewController {
    
    var currentChildViewController: UIViewController!
    
    func swapCurrentChild(to newViewController: UIViewController) {
        
        self.addChild(newViewController)
        self.view.addSubview(newViewController.view)
        newViewController.didMove(toParent: self)
        newViewController.view.frame = self.view.frame
        
        currentChildViewController.willMove(toParent: nil)
        currentChildViewController.view.removeFromSuperview()
        currentChildViewController.removeFromParent()
        
        self.currentChildViewController = newViewController
    }
}

// This is the root VC that holds the current view controller that acts
//  as a container for the view controller that is relevant for the app at any given time
class RootViewController: SingleChildContainerViewController {

    weak var coordinator: RootCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
}
