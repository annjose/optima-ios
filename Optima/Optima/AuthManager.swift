//
//  AuthManager.swift
//  Optima
//
//  Created by Jose, Ann Catherine on 11/12/18.
//  Copyright © 2018 Optima. All rights reserved.
//

import Foundation
import UIKit

class AuthManager {
    
    static let shared = AuthManager()
    
    func isSignedIn() -> Bool {
        return UserDefaults.standard.bool(forKey: "SIGNED_IN")
    }
}
