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
    var crypto: Crypto?
    //var resspone
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
        //Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    @objc func update() {
        if let url = URL(string:"https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest") {
                    var request = URLRequest(url: url)
                    request.addValue("305782b4-707c-43b8-8c33-1835adfe147a", forHTTPHeaderField: "X-CMC_PRO_API_KEY")
                    request.httpMethod = "GET"
                    let dataTask = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
                        do {
                            do {
                                let response = try JSONDecoder().decode(Crypto.self, from: data!)
                                //print(response)
                                let test = response.data[0].quote.USD.price
                                        DispatchQueue.main.async {
                                    
                                self.priceLabel.text = "\(test)"
                                }
                            } catch { print(error) }
                            }
                        }
        //                print(error!)
                        //handle response here
                    dataTask.resume()
                }

            
    }


}

