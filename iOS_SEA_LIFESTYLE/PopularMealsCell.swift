//
//  PopularMealsCell.swift
//  iOS_SEA_LIFESTYLE
//
//  Created by Subomi Popoola on 4/9/20.
//  Copyright © 2020 Ayo . All rights reserved.
//

import UIKit

class PopularMealsCell: UITableViewCell {

    @IBOutlet var mealPicture: UIImageView!
    @IBOutlet var rating: UILabel!
    @IBOutlet var synopsisLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
