//
//  CryptoListViewController.swift
//  Crypto Manager 02
//
//  Created by Hồ Sĩ Tuấn on 6/29/20.
//  Copyright © 2020 Hồ Sĩ Tuấn. All rights reserved.
//

import UIKit

class CryptoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as! CryptoTableViewCell
        cell.nameCrypto.text = self.cryptos?.data[0].name
        return cell
    }
    

    @IBOutlet var tableView: UITableView!
    var cryptos: Crypto? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        update( {
            print(self.cryptos!.data[0].name )
        })
        tableView.delegate = self
        tableView.dataSource = self
     // Do any additional setup after loading the view.
    }
    @objc func update(completion: @escaping () -> Void) {
        if let url = URL(string:"https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest") {
                    var request = URLRequest(url: url)
                    request.addValue("305782b4-707c-43b8-8c33-1835adfe147a", forHTTPHeaderField: "X-CMC_PRO_API_KEY")
                    request.httpMethod = "GET"
                    let dataTask = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
                        do {
                            do {
                                let response = try JSONDecoder().decode(Crypto.self, from: data!)
                                self.cryptos = response
                                completion()
                                //print(self.cryptos!.data[0].name)
                            } catch { print(error)
                                completion()
                            }
                            }
                        }
                    dataTask.resume()
            }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
