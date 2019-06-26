//
//  LoginViewController.swift
//  GigaPet
//
//  Created by Jake Connerly on 6/24/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import UIKit

enum LoginType {
    case signUp
    case signIn
}

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    //
    //MARK: - IBOutlets and Properties
    //
    
    @IBOutlet private weak var loginTypeSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var signInButton: UIButton!
    
    var apiController: ApiController?
    var loginType = LoginType.signUp

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //
    // MARK: - IBActions
    //
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
        guard let apiController = apiController else {
            print("Error loading ApiController")
            return }
        if let username = usernameTextField.text,
           !username.isEmpty,
           let password = passwordTextField.text,
           !password.isEmpty {
            let user = Parent(username: username, password: password)
            if loginType == .signUp {
                apiController.signUp(with: user) { error in
                    if let error = error {
                        print("ERROR OCCURED FURING SIGN UP: \(error)")
                    }else {
                        DispatchQueue.main.async {
                            let alertController = UIAlertController(title: "Sign Up Sucessful", message: "Now Please Log In", preferredStyle: .alert)
                            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                            alertController.addAction(alertAction)
                            self.present(alertController, animated: true, completion:  {
                                self.loginType = .signIn
                                self.loginTypeSegmentedControl.selectedSegmentIndex = 1
                                self.signInButton.setTitle("Sign In", for: .normal)
                            })
                        }
                    }
                }
            }else {
                apiController.signIn(with: user) { error in
                    if let error = error {
                        print("ERROR DURING SIGN IN: \(error)")
                    }else {
                        DispatchQueue.main.async {
                            self.dismiss(animated: true, completion: nil)
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func signInTypeChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 { // 0index = signUp
            loginType = .signUp
            signInButton.setTitle("Register", for: .normal)
        }else {
            loginType = .signIn
            signInButton.setTitle("Sign In", for: .normal)
        }
    }
}
