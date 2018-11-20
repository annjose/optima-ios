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
