//
//  NetworkManager.swift
//  MVVM Architecture
//
//  Created by Adwait Barkale on 01/01/24.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {
        // Singleton
    }
    
    func makePostAPICall<T: Decodable>(request: URLRequest, responseType: T.Type, completion: @escaping(Bool, T?) -> Void) {
        // Common Configurations
        var request = request
        request.httpMethod = "POST"
        request.timeoutInterval = 300
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")  // the request is JSON
        // API Call
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let safeData = data, error == nil {
                print("Response = \(String(data: safeData, encoding: .utf8) ?? "")")
                do {
                    let objResponse = try JSONDecoder().decode(responseType, from: safeData)
                    completion(true, objResponse)
                } catch let err {
                    print("Parsing Error = \(err.localizedDescription)")
                    completion(false, nil)
                }
            } else {
                print("Error = \(error?.localizedDescription ?? "")")
                completion(false, nil)
            }
        }.resume()
    }
    
    
}
