//
//  IngredientsCell.swift
//  iOS_SEA_LIFESTYLE
//
//  Created by Subomi Popoola on 4/17/20.
//  Copyright © 2020 Ayo . All rights reserved.
//

import UIKit

class IngredientsCell: UITableViewCell {

    @IBOutlet var ingredientLabel: UILabel!
    @IBOutlet var ingredientsImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
