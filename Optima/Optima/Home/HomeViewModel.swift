//
//  HomeViewModel.swift
//  Optima
//
//  Created by Jose, Ann Catherine on 11/19/18.
//  Copyright © 2018 Optima. All rights reserved.
//

import Foundation

class HomeViewModel {
    var title = ""
    var signOutButtonTitle = ""
    
    var items = [Item]()
    
    func configure() {
        title = "Home"
        signOutButtonTitle = "Sign Out"
        loadItems()
    }
    
    func signOut() -> Bool {
        // reset the user session (demo purpose only)
        UserDefaults.standard.set(false, forKey: "SIGNED_IN")
        return true
    }
    
    func itemViewModel(forIndexPath indexPath: IndexPath) -> ItemViewModel {
        let item = items[indexPath.row]
        return ItemViewModel(name: item.name, description: item.description)
    }
    
    private func loadItems() {
        items.append(Item(id: 1, name: "Item 1", description: "Details of item 1"))
        items.append(Item(id: 2, name: "Item 2", description: "Details of item 2"))
        items.append(Item(id: 3, name: "Item 3", description: "Details of item 3"))
        items.append(Item(id: 4, name: "Item 4", description: "Details of item 4"))
    }
}

struct ItemViewModel {
    let name: String
    let description: String
}
