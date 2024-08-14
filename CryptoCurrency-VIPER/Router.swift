//
//  Router.swift
//  CryptoCurrency-VIPER
//
//  Created by Melike Soygüllücü on 12.08.2024.
//

import Foundation

// Class, protocol
// Entry Point

protocol AnyRouter {
    static func startExecution() -> AnyRouter
}

class CryptoRouter : AnyRouter {
    
    static func startExecution() -> AnyRouter {
        let router = CryptoRouter()
        return router
    }
}
