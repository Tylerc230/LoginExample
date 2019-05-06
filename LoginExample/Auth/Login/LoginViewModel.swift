//
//  LoginViewModel.swift
//  LoginExample
//
//  Created by Tyler Casselman on 4/28/19.
//  Copyright © 2019 13bit consulting. All rights reserved.
//

import Foundation
protocol LoginUI: class {
}
class LoginViewModel {
    private var state = LoginState() {
        didSet {
            
        }
    }
    private unowned let ui: LoginUI
    init(with ui: LoginUI) {
        self.ui = ui
    }
    
    func usernameFieldDidUpdate(_ username: String) {
    }
    
}
