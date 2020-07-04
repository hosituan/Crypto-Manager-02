//
//  CryptoTableViewCell.swift
//  Crypto Manager 02
//
//  Created by Hồ Sĩ Tuấn on 6/29/20.
//  Copyright © 2020 Hồ Sĩ Tuấn. All rights reserved.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {


    @IBOutlet var nameCrypto: UILabel!
    @IBOutlet var iconCrypto: UIImageView!
    @IBOutlet var priceCrypto: UILabel!
    @IBOutlet var percent_1h: UILabel!
    @IBOutlet var percent_24h: UILabel!
    @IBOutlet var percent_7day: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(name: String, price: String, percent_1h: String, percent_24h: String, percent_7day: String){
        self.nameCrypto.text = name
        self.priceCrypto.text = price
        self.percent_1h.text = percent_1h
        self.percent_24h.text = percent_24h
        self.percent_7day.text = percent_7day
    }

}
