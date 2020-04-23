//
//  CookTableViewCell.swift
//  iOS_SEA_LIFESTYLE
//
//  Created by Ayo  on 4/23/20.
//  Copyright © 2020 Ayo . All rights reserved.
//

import UIKit

class CookTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
