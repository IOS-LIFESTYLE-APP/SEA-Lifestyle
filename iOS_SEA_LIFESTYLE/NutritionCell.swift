//
//  NutritionCell.swift
//  iOS_SEA_LIFESTYLE
//
//  Created by Ayo  on 4/17/20.
//  Copyright © 2020 Ayo . All rights reserved.
//

import UIKit

class NutritionCell: UITableViewCell {

    @IBOutlet weak var nutrition_label: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
