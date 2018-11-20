//
//  SignInViewController.swift
//  Optima
//
//  Created by Jose, Ann Catherine on 11/12/18.
//  Copyright © 2018 Optima. All rights reserved.
//

import UIKit

class SignInCoordinator: Coordinator {
    
    private let signInViewController: SignInViewController
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.signInViewController = SignInViewController()
        self.navigationController = navigationController
    }
    func start() {
        signInViewController.viewModel = SignInViewModel()
        signInViewController.coordinator = self
        navigationController.pushViewController(signInViewController, animated: true)
    }
    
    func showHomeScreen() {
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        homeCoordinator.start()
    }
}

class SignInViewController: UIViewController {

    var coordinator: SignInCoordinator?
    var viewModel: SignInViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureView()
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
}

class SignInViewModel {
    
    var title  = ""
    var signInButtonTitle = ""
    
    func configure() {
        title = "Sign In Screen"
        signInButtonTitle = "Sign In"
    }
    
    func signIn() -> Bool {
        // store the user session (demo purpose only)
        UserDefaults.standard.set(true, forKey: "SIGNED_IN")
        return true
    }
}
