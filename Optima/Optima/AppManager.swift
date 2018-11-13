//
//  AppManager.swift
//  Optima
//
//  Created by Jose, Ann Catherine on 11/12/18.
//  Copyright © 2018 Optima. All rights reserved.
//

import Foundation
import UIKit

class AppManager {
    
    static let shared = AppManager()
    private init() {
        self.rootViewController = RootViewController()
    }
    
    // The root view controller which launches other view controllers
    private var rootViewController: RootViewController
    
    func setUp() -> RootViewController {
        self.rootViewController = RootViewController()
        return rootViewController
    }
    
    func isSignedIn() -> Bool {
        return UserDefaults.standard.bool(forKey: "SIGNED_IN")
    }
    
    func signIn() {
        // store the user session (demo purpose only)
        UserDefaults.standard.set(true, forKey: "SIGNED_IN")
        
        rootViewController.showHomeScreen()
    }
    
    func signOut() {
        // reset the user session (demo purpose only)
        UserDefaults.standard.set(false, forKey: "SIGNED_IN")
        
        rootViewController.showSignInScreen()
    }
    
    func showSignInScreen() {
        rootViewController.showSignInScreen()
    }
    
    func showHomeScreen() {
        rootViewController.showHomeScreen()
    }
}
