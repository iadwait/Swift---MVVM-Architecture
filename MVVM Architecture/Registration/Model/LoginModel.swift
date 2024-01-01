//
//  LoginModel.swift
//  MVVM Architecture
//
//  Created by Adwait Barkale on 01/01/24.
//

import Foundation

struct LoginRequest: Encodable {
    
    var userID: String
    var password: String
    
}

struct LoginResponse: Decodable {
    
    var isSuccess: Bool
    var loginToken: String?
    var errorMessage: String?
    
//    enum CodingKeys: String, CodingKey {
//        case isSuccess
//        case loginToken = "LoginToken"
//        case errorMessage
//    }
    
}
