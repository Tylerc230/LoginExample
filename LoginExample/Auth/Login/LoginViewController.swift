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
    var viewModel: LoginViewModel?
}

extension LoginViewController: LoginUI {
    
}
