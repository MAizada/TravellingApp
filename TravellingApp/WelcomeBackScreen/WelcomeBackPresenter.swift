//
//  WelcomeBackPresenter.swift
//  TravellingApp
//
//  Created by Aizada on 06.05.2024.
//

import UIKit

protocol WelcomeBackPresenterProtocol: AnyObject {
    func login(email: String, password: String)
    func forgotPassword()
    func navigateToRegistration()
}

final class WelcomeBackPresenter: WelcomeBackPresenterProtocol {
    
    weak var view: WelcomeBackViewProtocol?
    var router: WelcomeBackRouterProtocol?
    var interactor: WelcomeBackInteractorProtocol?
    
    func login(email: String, password: String) {
        print("Attempting to log in with email: \(email)")
        interactor?.login(email: email, password: password) { [weak self] result in
            switch result {
            case .success:
                print("Login successful/PresenterWB")
                UserDefaults.standard.set(true, forKey: "RememberMe")
                UserDefaults.standard.set(email, forKey: "UserEmail")
                UserDefaults.standard.set(password, forKey: "UserPassword")
                UserDefaults.standard.synchronize()
                self?.router?.navigateToMainScreen()
            case .failure(let error):
                print("Login failed with error: \(error.localizedDescription)")
                DispatchQueue.main.async { [weak self] in
                    self?.view?.showLoginError(error)
                }
            }
        }
    }
    
    func forgotPassword() {
        print("Forgot password button tapped/PresenterWB")
        router?.navigateToForgotPassword()
    }
    
    func navigateToRegistration() {
        print("Sign up button tapped/PresenterWB")
        router?.navigateToRegistration()
    }
}
