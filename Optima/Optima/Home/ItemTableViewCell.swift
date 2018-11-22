//
//  ItemTableViewCell.swift
//  Optima
//
//  Created by Jose, Ann Catherine on 11/21/18.
//  Copyright © 2018 Optima. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    func configure(viewModel: ItemViewModel) {
        
        if let textLabel = textLabel {
            textLabel.text = viewModel.name
        }
    }
}

