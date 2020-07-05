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
    
    @IBOutlet var tableViewFrom: UITableView!
    @IBOutlet var tableViewTo: UITableView!
    @IBAction func exchangeButton(_ sender: UIButton) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewFrom.isHidden = true
        self.tableViewTo.isHidden = true
        exchangeFrom.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        exchangeTo.addTarget(self, action: #selector(self.textFieldDidChange1(_:)), for: .editingChanged)
        bindUI()
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        tableViewTo.isHidden = true
        if exchangeFrom.text != "" {
            self.tableViewFrom.isHidden = false }
        else {
            self.tableViewFrom.isHidden = true
        }
    }
    @objc func textFieldDidChange1(_ textField: UITextField) {
        if exchangeTo.text != "" {
            self.tableViewTo.isHidden = false }
        else {
            self.tableViewTo.isHidden = true
        }
    }
    
    func bindUI() {
         self.exchangeFrom.rx.text.throttle(1, scheduler: MainScheduler.instance).asObservable().bind(to: self.cryptoViewModel.searchInput).disposed(by: dispose)
         self.cryptoViewModel.searchResult.asObservable().bind(to: self.tableViewFrom.rx.items(cellIdentifier: "cellFromID", cellType: ExchangeTableViewCell.self)) {
             (index, data, cell) in cell.nameLabel.text = data.name
         }.disposed(by: dispose)
        
        self.exchangeTo.rx.text.throttle(1, scheduler: MainScheduler.instance).asObservable().bind(to: self.cryptoViewModelTo.searchInput).disposed(by: dispose)
        self.cryptoViewModelTo.searchResult.asObservable().bind(to: self.tableViewTo.rx.items(cellIdentifier: "cellToID", cellType: ExchangeTableViewCell.self)) {
            (index, data, cell) in cell.nameToLabel.text = data.name
        }.disposed(by: dispose)
    }
}

