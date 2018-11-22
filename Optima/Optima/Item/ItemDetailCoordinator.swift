//
//  ItemDetailCoordinator.swift
//  Optima
//
//  Created by Jose, Ann Catherine on 11/20/18.
//  Copyright © 2018 Optima. All rights reserved.
//

import UIKit

class ItemDetailCoordinator : Coordinator, ItemDetailViewCoordinatorDelegate {
    
    var viewController: ItemDetailViewController
    let navigationController: UINavigationController
    let item: Item
    
    init(navigationController: UINavigationController, item: Item) {
        self.navigationController = navigationController
        self.item = item
        
        // Create the view model, view controller and set the coordinator
        //  Note: In some cases, these two steps will be done in start() method too
        let viewModel = ItemDetailViewModel(item: item, theme: .light)
        //  let viewModel = ItemDetailViewModel(item: item, theme: .dark)
        viewController = ItemDetailViewController(viewModel: viewModel)
    }
    
    func start() {
        viewController.coordinatorDelegate = self
        navigationController.pushViewController(viewController , animated: true)
    }
    
    func stop() {
        viewController.coordinatorDelegate = nil
        navigationController.popViewController(animated: true)
    }
    
    // MARK: - ItemDetailViewCoordinatorDelegate methods
    func showAnotherView() {
        
    }
    
}

