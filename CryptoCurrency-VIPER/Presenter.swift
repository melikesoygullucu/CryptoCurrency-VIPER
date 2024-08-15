//
//  Presenter.swift
//  CryptoCurrency-VIPER
//
//  Created by Melike Soygüllücü on 12.08.2024.
//

import Foundation

// Talks to -> View, Interactor, Router
// Class, protocol

enum NetworkError : Error {
    case NetworkFailed
    case ParsingFailed
}

protocol AnyPresenter {
    var router : AnyRouter? {get set}
    var interactor : AnyInteractor? {get set}
    var view : AnyView? {get set}
    
    func interactorDidDownloadCrypto (result : Result<[Crypto], Error>)
}

class CryptoPresenter : AnyPresenter {

    var router: AnyRouter?
    
    var interactor: AnyInteractor?
    
    var view: AnyView?
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) {
        switch result {
        case .success(let cryptos):
            print("ok")
        case .failure(let error):
            print("error")
        }
    }
}
