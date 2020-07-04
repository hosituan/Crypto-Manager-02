//
//  ExchangeTableViewCell.swift
//  Crypto Manager 02
//
//  Created by Hồ Sĩ Tuấn on 7/5/20.
//  Copyright © 2020 Hồ Sĩ Tuấn. All rights reserved.
//

import UIKit

class ExchangeTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!

    @IBOutlet var nameToLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
