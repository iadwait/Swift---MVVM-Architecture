//
//  ViewController.swift
//  MVVM Architecture
//
//  Created by Adwait Barkale on 01/01/24.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variable Declarations
    let objLoginViewModel = LoginViewModel()
    
    // MARK: - IBOutlets
    @IBOutlet weak var btnLogin: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        objLoginViewModel.delegate = self
    }
    
    func setupUI() {
        btnLogin.setTitle("Login", for: .normal)
    }
    
    @IBAction func btnLoginTapped(_ sender: UIButton) {
        // Show Loader
        let request = LoginRequest(userID: "123", password: "ABCD")
        objLoginViewModel.handleLoginRequest(loginRequest: request)
    }

}

extension ViewController: LoginViewModelDelegate {
    
    func didReceiveLoginResponse(response: LoginResponse) {
        // Hide Loader
        if response.isSuccess && response.loginToken != "" {
            let alert = UIAlertController(title: "Success", message: "Login Token = \(response.loginToken ?? "")", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true)
        } else {
            var errorMessage = ""
            if ((response.errorMessage?.isEmpty) != nil) {
                errorMessage = response.errorMessage ?? ""
            } else {
                errorMessage = "Please Verify API as dummy API is being Used"
            }
            let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true)
        }
    }
    
}

