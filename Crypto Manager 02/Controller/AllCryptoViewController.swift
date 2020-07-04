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
    var selectedCrypto:data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
        self.tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func bindUI(){
        self.searchTextFeild.rx.text.throttle(1, scheduler: MainScheduler.instance).asObservable().bind(to: self.cryptoViewModel.searchInput).disposed(by: dispose)
        self.cryptoViewModel.searchResult.asObservable().bind(to: self.tableView.rx.items(cellIdentifier: "cellID", cellType: CryptoTableViewCell.self)) {
            (index, data, cell) in cell.configure(name: data.name, price: data.quote.USD.price, percent_1h: data.quote.USD.percent_change_1h, percent_24h: data.quote.USD.percent_change_24h , percent_7day: data.quote.USD.percent_change_24h)
        }.disposed(by: dispose)
    }
    

}

extension AllCryptoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectedCrypto = cryptoViewModel.searchResult.value[indexPath.row]
        
        performSegue(withIdentifier: "viewDetailSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "viewDetailSegue") {
            let vc = segue.destination as! CryptoViewController
            vc.crypto = selectedCrypto
            vc.navigationItem.title = selectedCrypto?.name
        }
    }
}




