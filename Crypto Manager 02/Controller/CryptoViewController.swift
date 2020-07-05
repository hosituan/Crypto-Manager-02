//
//  CryptoViewController.swift
//  Crypto Manager 02
//
//  Created by Hồ Sĩ Tuấn on 7/5/20.
//  Copyright © 2020 Hồ Sĩ Tuấn. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Charts

class CryptoViewController: UIViewController {
    
    var crypto:data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData(){
        if crypto != nil {
            print(crypto!.name)
        }
        else {
            print("nil")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "exchangeSegue") {
            let vc = segue.destination as! ExchangeViewController
            
            print(crypto!.name)
            vc.selectedFrom = crypto
        }
    }

}
