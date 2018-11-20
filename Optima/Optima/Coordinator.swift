//
//  Coordinator.swift
//  Optima
//
//  Created by Jose, Ann Catherine on 11/19/18.
//  Copyright © 2018 Optima. All rights reserved.
//

import Foundation

// Protocol that defines the contract for all coordinators so that view controllers
//  or other coordinators can confidently invoke this method to start the flow
protocol Coordinator {
    func start()
}
