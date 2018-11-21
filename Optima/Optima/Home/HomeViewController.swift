//
//  HomeViewController.swift
//  Optima
//
//  Created by Jose, Ann Catherine on 11/12/18.
//  Copyright © 2018 Optima. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var viewModel: HomeViewModel!
    var coordinator: HomeCoordinatorProtocol?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        print("HomeViewController:init()")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("HomeViewController:viewDidLoad()\n")
        configureView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("HomeViewController:viewWillDisappear()")
    }
    
    func configureView() {
        
        viewModel.configure()
        
        view.backgroundColor = .white
        title = viewModel.title
        
        let signOutButton = UIBarButtonItem(title: viewModel.signOutButtonTitle, style: .plain,
                                            target: self, action: #selector(signOut))
        navigationItem.rightBarButtonItem = signOutButton
    }
    
    @objc private func signOut() {
        let signedOut = viewModel.signOut()
        if signedOut {
            coordinator?.showSignInScreen()
        }
    }
    
    deinit {
        print("HomeViewController:deinit()")
    }
}
