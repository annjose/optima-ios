//
//  HomeViewController.swift
//  Optima
//
//  Created by Jose, Ann Catherine on 11/12/18.
//  Copyright © 2018 Optima. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureView()
    }
    
    func configureView() {
        
        view.backgroundColor = .white
        title = "Home"
        
        let signOutButton = UIBarButtonItem(title: "Sign Out", style: .plain,
                                            target: self, action: #selector(signOut))
        navigationItem.leftBarButtonItem = signOutButton
    }
    
    @objc private func signOut() {
        AppManager.shared.signOut()
    }
}
