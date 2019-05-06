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
    var usernameTextField = TextField()
    mutating func textUpdated(current: String, proposed: String, range: NSRange) {
        guard let textRange = Range(range, in: current) else {
            return
        }
        usernameTextField.text = current
        let potentialUsername = current.replacingCharacters(in: textRange, with: proposed)
        do {
            try validate(username: potentialUsername)
        } catch let error as TextField.ValidationError {
            usernameTextField.validationState = error
        } catch {
            
        }
        usernameTextField.text = potentialUsername
    }
    
    private func validate(username: String) throws {
        let usernameLengthRange = (4...16)
        let invalidCharacters = CharacterSet(charactersIn: "!@#$%^&*()")
        guard usernameLengthRange.contains(username.count) else {
            throw TextField.ValidationError.textLength
//            ("User name must be between \(usernameLengthRange.lowerBound) and \(usernameLengthRange.upperBound)" )
        }
        guard username.rangeOfCharacter(from: invalidCharacters) == nil else {
            throw TextField.ValidationError.invalidCharacters
//            ("Username must not contain \(invalidCharacters)")
        }
        
    }
    
    struct TextField {
        enum ValidationError: Error {
            case textLength, invalidCharacters
        }
        var text: String = ""
        var validationState: ValidationError?

        
    }
}
