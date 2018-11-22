//
//  ItemDetailViewModel.swift
//  Optima
//
//  Created by Jose, Ann Catherine on 11/22/18.
//  Copyright © 2018 Optima. All rights reserved.
//

import UIKit

class ItemDetailViewModel {
    
    let item: Item
    
    var theme: Theme
    
    var backgroundColor: UIColor?
    
    var itemNameText: String
    var itemNameTextColor: UIColor?
    var itemDescriptionText: String
    
    init(item: Item, theme: Theme = .light) {
        self.item = item
        
        self.theme = theme
        
        self.itemNameText = item.name
        self.itemDescriptionText = item.description
    }
    
    func configure() {
                
        // do any view-specific configuration
        switch theme {
        case .dark:
            backgroundColor = .black
            itemNameTextColor = .white
        default:
            backgroundColor = .white
            itemNameTextColor = UIColor.black
        }
    }
}

