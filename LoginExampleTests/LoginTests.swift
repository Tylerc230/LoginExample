//
//  LoginTests.swift
//  LoginExampleTests
//
//  Created by Tyler Casselman on 5/1/19.
//  Copyright © 2019 13bit consulting. All rights reserved.
//

import Quick
import Nimble
class LoginSpec: QuickSpec {
    override func spec() {
        describe("the login logic") {
            context("input validation") {
                var login = LoginState()
                it("updates with valid new text") {
                    login.textUpdated(current: "", proposed: "myUser", range: NSRange(location: 0, length: 0))
                    expect(login.usernameTextField.validationState).to(beNil())
                    expect(login.usernameTextField.text) == "myUser"
                }
                
                it("updates existing text with new text") {
                    login.textUpdated(current: "my", proposed: "User", range: NSRange(location: 2, length: 0))
                    expect(login.usernameTextField.validationState).to(beNil())
                    expect(login.usernameTextField.text) == "myUser"
                }
                
                it("contains length validation error") {
                    login.textUpdated(current: "", proposed: "my", range: NSRange(location: 0, length: 0))
                    expect(login.usernameTextField.validationState) == .textLength
                    
                }
                
                it("contains invalide character error") {
                    login.textUpdated(current: "my", proposed: "sk$" , range: NSRange(location: 2, length: 0))
                    expect(login.usernameTextField.validationState) == .invalidCharacters
                }
            }
        }
    }
}
