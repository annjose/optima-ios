//
//  SignInViewController.swift
//  Optima
//
//  Created by Jose, Ann Catherine on 11/12/18.
//  Copyright © 2018 Optima. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    var coordinator: SignInCoordinatorProtocol?
    var viewModel: SignInViewModel!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        print("SignInViewController:init()")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("SignInViewController:viewDidLoad()\n")
        configureView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("SignInViewController:viewWillDisappear()")
    }
    
    private func configureView() {
        
        viewModel.configure()
        
        view.backgroundColor = .white
        title = viewModel.title
        
        let signInButton = UIBarButtonItem(title: viewModel.signInButtonTitle, style: .plain,
                                           target: self, action: #selector(signIn))
        navigationItem.rightBarButtonItem = signInButton
    }
    
    @objc private func signIn() {
        let signedIn = viewModel.signIn()
        if signedIn {
            coordinator?.showHomeScreen()
        }
    }
    
    deinit {
        print("SignInViewController:deinit()")
    }
}
