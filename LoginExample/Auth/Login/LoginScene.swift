//
//  LoginViewModel.swift
//  LoginExample
//
//  Created by Tyler Casselman on 4/28/19.
//  Copyright © 2019 13bit consulting. All rights reserved.
//

import Foundation
protocol LoginUI: class {
    func update(with: LoginState.LoginViewModel)
}
class LoginScene {
    private var state = LoginState() {
        didSet {
            self.ui.update(with: state.loginViewModel)
        }
    }
    private unowned let ui: LoginUI
    init(with ui: LoginUI) {
        self.ui = ui
    }
    
    func usernameFieldDidUpdate(_ username: String?) {
        state.set(username: username)
    }
    
}
