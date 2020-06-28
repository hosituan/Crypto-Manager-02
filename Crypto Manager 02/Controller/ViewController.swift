//
//  ViewController.swift
//  Crypto Manager 02
//
//  Created by Hồ Sĩ Tuấn on 6/28/20.
//  Copyright © 2020 Hồ Sĩ Tuấn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var priceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //var url : String = "https://api.coinmarketcap.com/api/v1/cryptocurrency/price-performance-stats/latest"
        //let session = URLSession.shared
        

        if let url = URL(string: "https://blockchain.info/ticker") {
            var request = URLRequest(url: url)
            //request.addValue("305782b4-707c-43b8-8c33-1835adfe147a", forHTTPHeaderField: "X-CMC_PRO_API_KEY")
            request.httpMethod = "GET"
            let dataTask = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
                print(data!)
                do {
                    //let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                    do {
                       // data we are getting from network request
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(Cryptos.self, from: data!)
                        print(response.USD.m15) //Output - EMT
                    } catch { print(error) }
                    }
                }
//                print(error!)
                //handle response here
            dataTask.resume()
        }
        // Do any additional setup after loading the view.
    }


}

