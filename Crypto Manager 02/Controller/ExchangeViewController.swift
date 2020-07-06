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
    
    var selectedFrom:data?
    var selectedTo:data?
    @IBOutlet var exchangeFrom: UITextField!
    @IBOutlet var exchangeTo: UITextField!
    
    @IBOutlet var tableViewFrom: UITableView!
    @IBOutlet var tableViewTo: UITableView!
    @IBOutlet var exchangeBtn: UIButton!
    
    @IBOutlet var valueTo: UITextField!
    @IBOutlet var valueFrom: UITextField!
    
    
    @IBAction func exchangeButton(_ sender: UIButton) {
        if selectedFrom == nil && selectedTo == nil {
            showAlert(message: "Please select!")
        }
        else if (exchangeFrom.text != "" && exchangeTo.text != ""){
            let priceFrom = self.selectedFrom!.quote.USD.price
            let priceTo = self.selectedTo!.quote.USD.price
            
            if !valueFrom.text!.isEmpty {
                guard
                let valueFrom = Double(self.valueFrom.text!)
                else {
                    showAlert(message: "Wrong value!")
                    return
                }
                let value = round((valueFrom * priceFrom / priceTo) * 100000) / 100000
                self.valueTo.text = String(value)
            }
            else {
                showAlert(message: "You have not fill value!")
            }
        }
        else {
            showAlert(message: "Please select!")
        }

    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Warning", message: "\(message)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (Void) in
            self.valueFrom.becomeFirstResponder()
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewFrom.isHidden = true
        self.tableViewTo.isHidden = true
        self.tableViewFrom.delegate = self
        self.tableViewTo.delegate = self
        bindUI()
        configure()
        exchangeFrom.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        exchangeTo.addTarget(self, action: #selector(self.textFieldDidChange1(_:)), for: .editingChanged)
        dismissKey()

    }
    func configure() {
        self.exchangeBtn.layer.cornerRadius = 10
        if (self.selectedFrom?.name != "" ) {
            self.exchangeFrom.text = self.selectedFrom?.name
        }

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
        tableViewFrom.isHidden = true
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
extension ExchangeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tableViewFrom{
            self.selectedFrom = self.cryptoViewModel.searchResult.value[indexPath.row]
            let selectedItem = self.cryptoViewModel.searchResult.value[indexPath.row].name
            self.exchangeFrom.text = selectedItem
            self.tableViewFrom.isHidden = true
            self.tableViewTo.isHidden = true
            self.exchangeTo.becomeFirstResponder()
        } else if tableView == tableViewTo {
            self.selectedTo = self.cryptoViewModelTo.searchResult.value[indexPath.row]
            let selectedItem = self.cryptoViewModelTo.searchResult.value[indexPath.row].name
            self.exchangeTo.text = selectedItem
            self.tableViewFrom.isHidden = true
            self.tableViewTo.isHidden = true
            //self.exchangeFrom.becomeFirstResponder()
        }

    }
    
    func dismissKey()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard()
    {
    view.endEditing(true)
    }
}

