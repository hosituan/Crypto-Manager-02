////
////  CryptoListViewController.swift
////  Crypto Manager 02
////
////  Created by Hồ Sĩ Tuấn on 6/29/20.
////  Copyright © 2020 Hồ Sĩ Tuấn. All rights reserved.
////
//
//import UIKit
//import RxSwift
//import RxCocoa
//
//class CryptoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 100
//
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as! CryptoTableViewCell
//        cell.nameCrypto.text = self.cryptos?.data[indexPath.row].name
//        let price = self.cryptos?.data[indexPath.row].quote.USD.price
//        let p_1h = self.cryptos?.data[indexPath.row].quote.USD.percent_change_1h
//        let p_24h = self.cryptos?.data[indexPath.row].quote.USD.percent_change_24h
//        let p_7day = self.cryptos?.data[indexPath.row].quote.USD.percent_change_7d
//        if p_1h ?? 0 > 0.0 {
//            cell.percent_1h.textColor = .green
//        }
//        else { cell.percent_1h.textColor = .red}
//        if p_24h ?? 0 > 0.0 {
//            cell.percent_24h.textColor = .green
//        }else { cell.percent_24h.textColor = .red}
//        if p_7day ?? 0 > 0.0 {
//            cell.percent_7day.textColor = .green
//        } else { cell.percent_7day.textColor = .red}
//        
//        cell.priceCrypto.text = "$\(round( (price ?? 0) * 100) / 100)"
//        cell.percent_1h.text = "1h: \(round((p_1h ?? 0) * 100) / 100 )%"
//        cell.percent_24h.text = "24h: \(round((p_24h ?? 0) * 100) / 100 )%"
//        cell.percent_7day.text = "7days: \(round((p_7day ?? 0) * 100) / 100 )%"
//        return cell
//    }
//    
//
//    @IBOutlet var tableView: UITableView!
//    var cryptos: Crypto?
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.update() { result in
//            switch result {
//            case .failure(let error):
//                print(error)
//            case .success(let cryptos):
//                self.cryptos = cryptos
//                self.tableView.reloadData()
//            }
//        }
//        tableView.delegate = self
//        tableView.dataSource = self
//        self.tableView.reloadData()
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
//            self.tableView.reloadData()
//        })
////        Timer.scheduledTimer(withTimeInterval: 30, repeats: true, block: {_ in
////            self.update() { result in
////                switch result {
////                case .failure(let error):
////                    print(error)
////                case .success(let cryptos):
////                    self.cryptos = cryptos
////                    self.tableView.reloadData()
////                }
////            }
////        })
//     // Do any additional setup after loading the view.
//    }
//    func update(completion: @escaping (Result<Crypto, Error>) -> Void) {
//        if let url = URL(string:"https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest") {
//                    var request = URLRequest(url: url)
//                    request.addValue("32a5390d-2f44-464d-834e-039245007168", forHTTPHeaderField: "X-CMC_PRO_API_KEY")
//                    request.httpMethod = "GET"
//                    let dataTask = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
//                        guard let responseData = data, error == nil else {
//                            DispatchQueue.main.async { completion(.failure(error ?? NetworkError.unknownError(data, response))) }
//                            return
//                        }
//
//                        do {
//                            let response = try JSONDecoder().decode(Crypto.self, from: responseData)
//                            DispatchQueue.main.async { completion(.success(response)) }
//                        } catch {
//                            DispatchQueue.main.async { completion(.failure(error)) }
//                        }
//                        enum NetworkError: Error {
//                            case unknownError(Data?, URLResponse?)
//                        }
//                    }
//                    dataTask.resume()
//            }
//    }
//    
//    
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
