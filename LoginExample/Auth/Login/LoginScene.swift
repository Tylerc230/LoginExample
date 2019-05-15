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
            updateUI()
        }
    }
    private unowned let ui: LoginUI
    init(with ui: LoginUI) {
        self.ui = ui
    }
    
    func viewLoaded() {
        updateUI()
    }
    
    func usernameFieldDidUpdate(_ username: String?) {
        state.set(username: username)
    }
    
    func passwordFieldDidUpdate(_ password: String?) {
        state.set(password: password)
    }
    
    func donePressed() {
        let action = state.actionOnDone()
        handle(action: action)
    }
}

private extension LoginScene {
    func updateUI() {
        ui.update(with: state.loginViewModel)
    }
    
    func handle(action: LoginState.Action) {
        
    }
}
