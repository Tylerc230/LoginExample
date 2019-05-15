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
        describe("the login state") {
            var login = LoginState()
            context("input validation") {
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
            context("login button") {
                it("is disabled initially") {
                    let viewModel = login.loginViewModel
                    expect(viewModel.loginButtonEnabled).to(beFalse())
                }
                
                it("is enabled with valid input") {
                    login.set(username: "tylerc")
                    login.set(password: "hello")
                    let viewModel = login.loginViewModel
                    expect(viewModel.loginButtonEnabled).to(beTrue())
                }
            }
        }
    }
}
