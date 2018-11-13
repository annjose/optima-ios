//
//  SignInViewController.swift
//  Optima
//
//  Created by Jose, Ann Catherine on 11/12/18.
//  Copyright © 2018 Optima. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureView()
    }
    
    private func configureView() {
        
        view.backgroundColor = .white
        title = "Sign In Screen"
        
        let signInButton = UIBarButtonItem(title: "Sign In", style: .plain,
                                           target: self, action: #selector(signIn))
        navigationItem.rightBarButtonItem = signInButton
    }
    
    @objc private func signIn() {
        AppManager.shared.signIn()
    }
}
