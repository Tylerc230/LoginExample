//
//  LoginViewController.swift
//  LoginExample
//
//  Created by Tyler Casselman on 4/28/19.
//  Copyright © 2019 13bit consulting. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var loginButton: UIButton!
    var viewModel: LoginScene?
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameField.layer.borderWidth = 1.0
    }
    @IBAction func usernameDidChange() {
        viewModel?.usernameFieldDidUpdate(usernameField.text)
    }
    
    func colorFor(validation: LoginState.ValidationState) -> CGColor {
        if validation == .valid {
            return UIColor.clear.cgColor
        } else {
            return UIColor.red.cgColor
        }
    }
}


extension LoginViewController: LoginUI {
    func update(with viewModel: LoginState.LoginViewModel) {
        usernameField.text = viewModel.username.text
        passwordField.text = viewModel.password.text
        usernameField.layer.borderColor = colorFor(validation: viewModel.username.validationState)
    }
}
