//
//  CryptoViewModel.swift
//  Crypto Manager 02
//
//  Created by Hồ Sĩ Tuấn on 7/4/20.
//  Copyright © 2020 Hồ Sĩ Tuấn. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CryptoViewModel: NSObject {
    var searchInput = BehaviorRelay<String?>(value: "")
    var searchResult = BehaviorRelay<[data]>(value: [])
    var requestResult = BehaviorRelay<[data]>(value: [])
    let dispose = DisposeBag()
    
    override init() {
        super.init()
        self.requestJson(url: "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest", apikey: "305782b4-707c-43b8-8c33-1835adfe147a", feild:"X-CMC_PRO_API_KEY" )
        bindingData()
    }
    
    func bindingData() {
            self.searchInput.asObservable().subscribe(onNext: { (text) in
                 if text!.isEmpty || text!.contains(" "){
                    print("nothing")
                    self.searchResult.accept(self.requestResult.value)
                 }
                else {
                    var cryptoArray: Array<data> = []
                    for index in stride(from: self.requestResult.value.count - 1, to: -1, by: -1)
                    {
                        if self.requestResult.value[index].name.lowercased().contains("\(text!.lowercased())") {
                            cryptoArray.insert(self.requestResult.value[index], at: 0)
                        }
                    }
                    self.searchResult.accept(cryptoArray)
                }
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: dispose)
    }
    func requestJson(url: String, apikey: String, feild: String){
        let url = URL(string: url)
        var request = URLRequest(url: url!)
        request.addValue(apikey, forHTTPHeaderField: feild)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { (data, response, err) in
            if err == nil {
                do {
                    let response = try JSONDecoder().decode(CryptoModel.self, from: data!)
                    self.requestResult.accept(response.data)
                    self.searchResult.accept(response.data)
                }
                catch {
                }
            }
        }.resume()
        
    }
}
