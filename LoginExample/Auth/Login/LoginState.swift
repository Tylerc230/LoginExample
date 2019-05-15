//
//  LoginState.swift
//  LoginExample
//
//  Created by Tyler Casselman on 4/28/19.
//  Copyright © 2019 13bit consulting. All rights reserved.
//
//
import Foundation
struct LoginState {
    enum Action {
        case none, attemptLogin(username: String, password: String)
    }
    enum ValidationState: Error {
        case valid, invalidLength, invalidCharacters
    }
    mutating func set(username: String?) {
        guard let username = username else {
            return
        }
        loginViewModel.username = usernameTextField(for: username)
    }
    
    mutating func set(password: String?) {
        guard let password = password else {
            return
        }
        loginViewModel.password = passwordTextField(for: password)
    }
    
    func actionOnDone() -> Action {
        guard loginViewModel.loginButtonEnabled else {
            return .none
        }
        return .attemptLogin(username: loginViewModel.username.text, password: loginViewModel.password.text)
    }
    
    var loginViewModel = LoginViewModel()

    struct LoginViewModel {
        var username = TextField()
        var password = TextField()
        var loginButtonEnabled: Bool {
            return username.text != "" &&
                username.validationState == .valid &&
                password.text != "" &&
                password.validationState == .valid
        }
        
        struct TextField {
            init(text: String = "", validationState: ValidationState = .valid) {
                self.text = text
                self.validationState = validationState
            }
            let text: String
            let validationState: ValidationState
        }
    }

}

private extension LoginState {
    func usernameTextField(for username: String) -> LoginViewModel.TextField {
        let validation = validate(username: username)
        return LoginViewModel.TextField(text: username, validationState: validation)
    }
    
    func passwordTextField(for password: String) -> LoginViewModel.TextField {
        return LoginViewModel.TextField(text: password, validationState: .valid)
    }
    
    func validate(username: String) -> ValidationState {
        let usernameLengthRange = (4...16)
        let invalidCharacters = CharacterSet(charactersIn: "!@#$%^&*()")
        guard usernameLengthRange.contains(username.count) else {
            return ValidationState.invalidLength
        }
        guard username.rangeOfCharacter(from: invalidCharacters) == nil else {
            return ValidationState.invalidCharacters
        }
        return .valid
        
    }
    
}
