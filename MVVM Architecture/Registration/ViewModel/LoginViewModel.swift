//
//  LoginViewModel.swift
//  MVVM Architecture
//
//  Created by Adwait Barkale on 01/01/24.
//

import Foundation

protocol LoginViewModelDelegate {
    func didReceiveLoginResponse(response: LoginResponse)
}

class LoginViewModel {
    
    var delegate: LoginViewModelDelegate?
    
    func handleLoginRequest(loginRequest: LoginRequest) {
        // Perform Login Validations
        let validationResult = LoginValidations.shared.valdateLoginRequest(loginRequest: loginRequest)
        if validationResult.isSucess {
            // Initiate Login Api Call
            LoginResource.shared.loginUser(loginRequest: loginRequest) { isSuccess, loginResponse in
                DispatchQueue.main.async {
                    self.delegate?.didReceiveLoginResponse(response: loginResponse!)
                }
            }
        } else {
            DispatchQueue.main.async {
                self.delegate?.didReceiveLoginResponse(response: LoginResponse(isSuccess: false, loginToken: "", errorMessage: validationResult.errorMessage))
            }
        }
    }
    
    
}
