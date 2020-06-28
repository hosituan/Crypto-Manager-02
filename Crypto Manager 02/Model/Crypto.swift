//
//  Cryto.swift
//  Crypto Manager 02
//
//  Created by Hồ Sĩ Tuấn on 6/28/20.
//  Copyright © 2020 Hồ Sĩ Tuấn. All rights reserved.
//

import Foundation
public struct Crypto : Codable {
       struct data : Codable {
        let id: Int
        let name: String
        let symbol: String
        let slug: String
        struct quote : Codable {
            struct USD : Codable {
                let price: Double
                let volume_24h: Double
            }
            let USD: USD
        }
        let quote: quote
       }
    let data: [data]
}

