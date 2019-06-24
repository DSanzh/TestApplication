//
//  LoginDataStore.swift
//  HeadsAndHands
//
//  Created by Sanzh on 6/10/19.
//  Copyright © 2019 D Sanzhar. All rights reserved.
//

import Foundation

protocol LoginDataStoreProtocol {
    var email: String { get set }
    var password: String { get set }
}

class LoginDataStore: LoginDataStoreProtocol {
    var email: String = ""
    var password: String = ""
    
}
