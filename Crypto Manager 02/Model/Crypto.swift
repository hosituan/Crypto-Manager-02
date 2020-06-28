//
//  Cryto.swift
//  Crypto Manager 02
//
//  Created by Hồ Sĩ Tuấn on 6/28/20.
//  Copyright © 2020 Hồ Sĩ Tuấn. All rights reserved.
//

import Foundation
public struct Cryptos : Codable {
       struct USDs : Codable {
            let m15: Double
            let last: Double
            let buy: Double
            let sell: Double
            let symbol: String
        private enum CodingKeys : String, CodingKey {
            case m15 = "15m"
            case last
            case buy
            case sell
            case symbol
           }
       }
   let USD: USDs
}

