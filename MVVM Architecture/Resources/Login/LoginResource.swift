//
//  LoginResource.swift
//  MVVM Architecture
//
//  Created by Adwait Barkale on 01/01/24.
//

import Foundation

class LoginResource {
    
    static let shared = LoginResource()
    
    func loginUser(loginRequest: LoginRequest, completion: @escaping(Bool, LoginResponse?) -> Void) {
        do {
            // Endpoint
            let endPoint = APIEndpoints.loginAPI
            var request = URLRequest(url: URL(string: endPoint)!)
            request.httpBody = try JSONEncoder().encode(loginRequest)
            print("JSON Request = \(String(data: request.httpBody ?? Data(), encoding: .utf8) ?? "")")
            // Network Manager Call
            NetworkManager.shared.makePostAPICall(request: request, responseType: LoginResponse.self) { isSuccess, response in
                completion(isSuccess, response)
            }
        } catch let err {
            completion(false, LoginResponse(isSuccess: false, loginToken: "", errorMessage: err.localizedDescription))
        }
    }
    
    
}
