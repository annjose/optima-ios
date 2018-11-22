//
//  ItemDetailViewController.swift
//  Optima
//
//  Created by Jose, Ann Catherine on 11/20/18.
//  Copyright © 2018 Optima. All rights reserved.
//

import UIKit

protocol ItemDetailViewCoordinatorDelegate: class {
    func showAnotherView()
}

enum Theme {
    case light
    case dark
}

class ItemDetailViewController: UIViewController {

    private let viewModel: ItemDetailViewModel
    weak var coordinatorDelegate: ItemDetailViewCoordinatorDelegate?
    
    // UI controls - labels, buttons, text views etc.
    private var itemNameLabel = UILabel()
    
    init(viewModel: ItemDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // viewModel.theme = .dark
        viewModel.configure()
        
        configureView()
    }
    
    func configureView() {
        
         view.backgroundColor = viewModel.backgroundColor
        
        // Add a label
        itemNameLabel = UILabel()
        itemNameLabel.text = viewModel.itemNameText
        itemNameLabel.textColor = viewModel.itemNameTextColor
        itemNameLabel.textAlignment = .center
        view.addSubview(itemNameLabel)
                
        configureConstraints()
    }
    
    func configureConstraints() {
        
        itemNameLabel.translatesAutoresizingMaskIntoConstraints = false

        let constraints: [NSLayoutConstraint] = [
            itemNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            itemNameLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            itemNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            itemNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)

        ]
        NSLayoutConstraint.activate(constraints)
    }
}
