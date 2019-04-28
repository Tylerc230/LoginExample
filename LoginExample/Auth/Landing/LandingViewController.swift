//
//  LandingViewController.swift
//  LoginExample
//
//  Created by Tyler Casselman on 4/28/19.
//  Copyright © 2019 13bit consulting. All rights reserved.
//

import UIKit
protocol LandingViewControllerDelegate: class {
    func loginRequested()
    func signupRequested()
}
class LandingViewController: UIViewController {
    weak var delegate: LandingViewControllerDelegate?
    @IBAction func loginTapped() {
        delegate?.loginRequested()
    }
    @IBAction func signupTapped() {
        delegate?.signupRequested()
    }
    
}
