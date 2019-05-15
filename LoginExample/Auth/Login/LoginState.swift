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
    enum ValidationState: Error {
        case valid, invalidLength, invalidCharacters
    }
    mutating func set(username: String?) {
        guard let username = username else {
            return
        }
        loginViewModel.username.validationState = validate(username: username)
        loginViewModel.username.text = username
    }
    
    var loginViewModel = LoginViewModel()

    struct LoginViewModel {
        var username = TextField()
        var password = TextField()
        struct TextField {
            var text = ""
            var validationState: ValidationState = .valid
        }
    }

}

private extension LoginState {
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
