//
//  LoginValidations.swift
//  MVVM Architecture
//
//  Created by Adwait Barkale on 01/01/24.
//

import Foundation

class LoginValidations {
    
    static let shared = LoginValidations()
    
    func valdateLoginRequest(loginRequest: LoginRequest) -> (isSucess: Bool, errorMessage: String?) {
        if loginRequest.userID == "" {
            return (false, "User ID Empty")
        } else if loginRequest.password == "" {
            return (false, "Password Empty")
        }
        return (true, "")
    }
}
