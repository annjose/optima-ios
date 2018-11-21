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
    
    private var tableView: UITableView!
    
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
        
        viewModel.configure()
        configureView()
        configureConstraints()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("HomeViewController:viewWillDisappear()")
    }
    
    private func configureView() {
        
        view.backgroundColor = .white
        title = viewModel.title
        
        let signOutButton = UIBarButtonItem(title: viewModel.signOutButtonTitle, style: .plain,
                                            target: self, action: #selector(signOut))
        navigationItem.rightBarButtonItem = signOutButton
        
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")

        self.view.addSubview(tableView)
    }
    
    private func configureConstraints() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let constraints: [NSLayoutConstraint] = [
            
            // Anchor the top-level container view to the main view
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
        ]
        NSLayoutConstraint.activate(constraints)

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

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("row selected \(indexPath)")
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        let itemViewModel = viewModel.itemViewModel(forIndexPath: indexPath)
        cell.textLabel!.text = itemViewModel.name
        return cell
    }
}
