//
//  SplashViewController.swift
//  Optima
//
//  Created by Jose, Ann Catherine on 11/12/18.
//  Copyright © 2018 Optima. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    private let activityIndicator = UIActivityIndicatorView(style: .white)
    
    var coordinator: RootCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureView()
    }
    
    private func configureView() {
        
        view.backgroundColor = .gray
        view.addSubview(activityIndicator)
        
        activityIndicator.frame = view.bounds
        activityIndicator.backgroundColor = UIColor(white: 0, alpha: 0.4)
        
        fetchData()
    }
    
    private func fetchData() {
        activityIndicator.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1)) {
            [weak self] in
            
            guard let strongSelf = self else { return }
            strongSelf.activityIndicator.stopAnimating()
            
            if AppManager.shared.isSignedIn() {
                // show post-auth screen
                //AppManager.shared.showHomeScreen()
                strongSelf.coordinator?.showHomeScreen()
            } else {
                // show sign-in screen
                //AppManager.shared.showSignInScreen()
                strongSelf.coordinator?.showSignInScreen()
            }
        }
    }
}
