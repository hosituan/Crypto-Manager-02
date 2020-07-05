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
    func configure(name: String, price: Double, percent_1h: Double, percent_24h: Double, percent_7day: Double){
        
        if percent_1h > 0.0 {
            self.percent_1h.textColor = .green
            }
        else { self.percent_1h.textColor = .red}
        
        if percent_24h > 0.0 {
            self.percent_24h.textColor = .green
        }else { self.percent_24h.textColor = .red}
        
        if percent_7day > 0.0 {
            self.percent_7day.textColor = .green
        } else { self.percent_7day.textColor = .red}
            
        self.nameCrypto.text = name
        self.priceCrypto.text = "$\(round( (price ) * 100) / 100)"
        self.percent_1h.text = "1h: \(round((percent_1h ) * 100) / 100 )%"
        self.percent_24h.text = "24h: \(round((percent_24h ) * 100) / 100 )%"
        self.percent_7day.text = "7days: \(round((percent_7day ) * 100) / 100 )%"
    }
    

}
