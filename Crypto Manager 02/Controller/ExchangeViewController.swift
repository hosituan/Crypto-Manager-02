//
//  ExchangeViewController.swift
//  Crypto Manager 02
//
//  Created by Hồ Sĩ Tuấn on 7/5/20.
//  Copyright © 2020 Hồ Sĩ Tuấn. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ExchangeViewController: UIViewController {
    
    var cryptoViewModel = CryptoViewModel()
    var cryptoViewModelTo = CryptoViewModel()
    var dispose = DisposeBag()

    @IBOutlet var exchangeFrom: UITextField!
    @IBOutlet var exchangeTo: UITextField!
    

    @IBAction func exchangeButton(_ sender: UIButton) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    


}

