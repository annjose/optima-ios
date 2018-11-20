//
//  HomeViewController.swift
//  Optima
//
//  Created by Jose, Ann Catherine on 11/12/18.
//  Copyright © 2018 Optima. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    let homeViewController: HomeViewController
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.homeViewController = HomeViewController()
    }
    
    func start() {
        homeViewController.viewModel = HomeViewModel()
        homeViewController.coordinator = self
        navigationController.pushViewController(homeViewController, animated: true)
    }
    
    func showSignInScreen() {
        let signInCoordinator = SignInCoordinator(navigationController: navigationController)
        signInCoordinator.start()
    }
}

class HomeViewModel {
    var title = ""
    var signOutButtonTitle = ""
    
    func configure() {
        title = "Home"
        signOutButtonTitle = "Sign Out"
    }
    
    func signOut() -> Bool {
        // reset the user session (demo purpose only)
        UserDefaults.standard.set(false, forKey: "SIGNED_IN")
        return true
    }
}

class HomeViewController: UIViewController {

    var viewModel: HomeViewModel!
    var coordinator: HomeCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureView()
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
}
