//
//  AuthFlowCoordinator.swift
//  LoginExample
//
//  Created by Tyler Casselman on 4/28/19.
//  Copyright © 2019 13bit consulting. All rights reserved.
//

import UIKit
class AuthFlowCoordinator {
    func start(with window: UIWindow) {
        nav.viewControllers = [landingView]
        window.rootViewController = nav
    }
    
    private let nav = UINavigationController()
    private var landingView: LandingViewController {
        let landingView = storyboard.instantiateInitialViewController() as! LandingViewController
        landingView.delegate = self
        return landingView
    }
    
    private var loginView: LoginViewController {
        let loginView = storyboard.instantiateViewController(withIdentifier: "Login") as! LoginViewController
        let loginViewModel = LoginScene(with: loginView)
        loginView.viewModel = loginViewModel
        return loginView
    }
    
    private var storyboard: UIStoryboard {
        return UIStoryboard(name: "Auth", bundle: nil)
    }
}

extension AuthFlowCoordinator: LandingViewControllerDelegate {
    func loginRequested() {
        nav.pushViewController(loginView, animated: true)
    }
    
    func signupRequested() {
        
    }
}
