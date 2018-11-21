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
    
    var coordinator: SplashCoordinatorProtocol?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        print("SplashViewController:init()")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("SplashViewController:viewDidLoad()\n")
        configureView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("SplashViewController:viewWillDisappear()")
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
            
            guard let coordinator = strongSelf.coordinator else {
                print("ERROR SplashViewController: coordinator is nil; cannot show the next screen.")
                return
            }
            if AuthManager.shared.isSignedIn() {
                // show post-auth screen
                coordinator.showHomeScreen()
            } else {
                // show sign-in screen
                coordinator.showSignInScreen()
            }
        }
    }
    
    deinit {
        print("SplashViewController:deinit()")
    }
}
