//
//  AllCryptoViewController.swift
//  Crypto Manager 02
//
//  Created by Hồ Sĩ Tuấn on 7/4/20.
//  Copyright © 2020 Hồ Sĩ Tuấn. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AllCryptoViewController: UIViewController {

    @IBOutlet var searchTextFeild: UITextField!
    @IBOutlet var tableView: UITableView!
    var cryptoViewModel = CryptoViewModel()
    var dispose = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
        // Do any additional setup after loading the view.
    }
    
    func bindUI(){
        self.searchTextFeild.rx.text.throttle(1, scheduler: MainScheduler.instance).asObservable().bind(to: self.cryptoViewModel.searchInput).disposed(by: dispose)
        self.cryptoViewModel.searchResult.asObservable().bind(to: self.tableView.rx.items(cellIdentifier: "cellID", cellType: CryptoTableViewCell.self)) {
            (index, data, cell) in cell.configure(name: data.name, price: String(data.quote.USD.price), percent_1h: "a", percent_24h: "a", percent_7day: "a")
        }.disposed(by: dispose)
    }
}


