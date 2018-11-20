//
//  SignInViewModel.swift
//  Optima
//
//  Created by Jose, Ann Catherine on 11/19/18.
//  Copyright © 2018 Optima. All rights reserved.
//

import Foundation

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
