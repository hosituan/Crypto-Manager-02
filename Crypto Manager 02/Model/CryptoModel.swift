//
//  Cryto.swift
//  Crypto Manager 02
//
//  Created by Hồ Sĩ Tuấn on 6/28/20.
//  Copyright © 2020 Hồ Sĩ Tuấn. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa



struct CryptoModel: Codable{
    struct status: Codable {
        let timestamp: String
        let error_message: String
    }
    let data: [data]
}
struct data : Codable {
 let id: Int
 let name: String
 let symbol: String
 let cmc_rank: Int
 let slug: String
 struct quote : Codable {
     struct USD : Codable {
         let price: Double
         let volume_24h: Double
         let percent_change_1h: Double
         let percent_change_24h: Double
         let percent_change_7d: Double
     }
     let USD: USD
 }
 let quote: quote
}

