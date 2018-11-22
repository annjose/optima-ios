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
    
    var backgroundColor: UIColor = .white
    
    var itemNameText: String
    var itemDescriptionText: String
    
    init(item: Item, theme: Theme = .light) {
        self.item = item
        
        self.theme = theme
        
        self.itemNameText = item.name
        self.itemDescriptionText = item.description
    }
    
    var themeSwitchButtonLabel: String {
        return theme == .light ? "Dark Mode" : "Light Mode"
    }
    
    var itemNameTextColor: UIColor {
        return theme == .light ? .black : .white
    }
    
    
    func configure() {
                
        // Do any view-specific configuration, for example, a theme for background colot
        //  Note: This is just used as an example, it could've been a computed property like `itemNameTextColor`
        switch theme {
        case .dark:
            backgroundColor = .black
        default:
            backgroundColor = .white
        }
    }
    
    func toggleTheme() {
        theme.toggle()
        
        configure()
    }
}

