//
//  View.swift
//  CryptoCurrency-VIPER
//
//  Created by Melike Soygüllücü on 12.08.2024.
//

import Foundation
import UIKit

// Talks to -> Presenter
// Class, protocol
// ViewController

protocol AnyView {
    var presenter : AnyPresenter? {get set}
    func update(with cryptos : [Crypto])
    func update(with error : String)
    
}

class CryptoViewController : UIViewController, AnyView, UITableViewDelegate, UITableViewDataSource {
    var presenter: AnyPresenter?
    var cryptos : [Crypto] = []
    
    private var tableView : UITableView {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.isHidden = true
        return table
    }
    
    private var messageLabel : UILabel {
        let message = UILabel()
        message.isHidden = false
        message.text = "Loading..."
        message.font = UIFont.systemFont(ofSize: 20)
        message.textColor = .black
        message.textAlignment = .center
        return message
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        view.addSubview(messageLabel)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        messageLabel.frame = CGRect(x: view.frame.width / 2 - 100, y: view.frame.height / 2 - 25, width: 200, height: 50)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func update(with cryptos: [Crypto]) {
        DispatchQueue.main.async {
            self.cryptos = cryptos
            self.messageLabel.isHidden = true
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    
    func update(with error: String) {
        
    }
    
    
}
