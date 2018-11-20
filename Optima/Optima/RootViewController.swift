//
//  RootViewController.swift
//  Optima
//
//  Created by Jose, Ann Catherine on 11/19/18.
//  Copyright © 2018 Optima. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    private var currentViewController: UIViewController!

    private let activityIndicator = UIActivityIndicatorView(style: .white)

    weak var coordinator: RootCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
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
                strongSelf.coordinator?.showHomeScreen()
            } else {
                // show sign-in screen
                strongSelf.coordinator?.showSignInScreen()
            }
        }
    }

}
