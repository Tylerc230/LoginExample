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
                    login.set(username: "myUser")
                    let viewModel = login.loginViewModel
                    expect(viewModel.username.validationState) == .valid
                    expect(viewModel.username.text) == "myUser"
                }
                
                it("contains length validation error") {
                    login.set(username: "my")
                    let viewModel = login.loginViewModel
                    expect(viewModel.username.validationState) == .invalidLength
                    
                }
                
                it("contains invalide character error") {
                    login.set(username: "mysk$")
                    let viewModel = login.loginViewModel
                    expect(viewModel.username.validationState) == .invalidCharacters
                }
            }
        }
    }
}
