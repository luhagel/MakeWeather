//
//  tenDayTableViewCell.swift
//  MakeWeather-starter
//
//  Created by Luca Hagel on 9/20/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

class tenDayTableViewCell: UITableViewCell {
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
