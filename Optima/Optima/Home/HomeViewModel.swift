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
    
    var items = [ItemViewModel]()
    
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
        return items[indexPath.row]
    }
    
    private func loadItems() {
        items.append(ItemViewModel(name: "Item 1", description: "Details of item 1"))
        items.append(ItemViewModel(name: "Item 2", description: "Details of item 2"))
        items.append(ItemViewModel(name: "Item 3", description: "Details of item 3"))
        items.append(ItemViewModel(name: "Item 4", description: "Details of item 4"))
    }
}

struct ItemViewModel {
    let name: String
    let description: String
}
