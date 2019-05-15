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
        case empty, valid, invalidLength, invalidCharacters
        var isError: Bool {
            return self != .empty && self != .valid
        }
    }
    func actionOnDone() -> Action {
        //todo start loading spinners here
        guard bothFieldsComplete else {
            return .none
        }
        return .attemptLogin(username: loginViewModel.username.text, password: loginViewModel.password.text)
    }
    
    var loginViewModel: LoginViewModel {
        var viewModel = LoginViewModel()
        viewModel.username = usernameTextField(for: username)
        viewModel.password = passwordTextField(for: password)
        viewModel.loginButtonEnabled = bothFieldsComplete
        return viewModel
    }
    
    var username: String?
    var password: String?

    struct LoginViewModel {
        var username = TextField()
        var password = TextField()
        var loginButtonEnabled = false

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
    func usernameTextField(for username: String?) -> LoginViewModel.TextField {
        let validation = validate(username: username)
        return LoginViewModel.TextField(text: username ?? "", validationState: validation)
    }
    
    func passwordTextField(for password: String?) -> LoginViewModel.TextField {
        return LoginViewModel.TextField(text: password ?? "", validationState: .valid)
    }
    
    var bothFieldsComplete: Bool {
        return username != "" &&
            validate(username: username) == .valid &&
            password != ""
    }
    
    func validate(username: String?) -> ValidationState {
        guard let username = username, username != "" else {
            return .empty
        }
        let usernameLengthRange = (4...16)
        let invalidCharacters = CharacterSet(charactersIn: "!@#$%^&*()")
        guard usernameLengthRange.contains(username.count) else {
            return .invalidLength
        }
        guard username.rangeOfCharacter(from: invalidCharacters) == nil else {
            return .invalidCharacters
        }
        return .valid
        
    }
    
}
