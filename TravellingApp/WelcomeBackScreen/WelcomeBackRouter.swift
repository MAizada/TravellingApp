//
//  WelcomeBackRouter.swift
//  TravellingApp
//
//  Created by Aizada on 06.05.2024.
//

import UIKit

protocol WelcomeBackRouterProtocol: AnyObject {
    func navigateToForgotPassword()
    func navigateToRegistration()
    func navigateToMainScreen()
}

final class WelcomeBackRouter {
    
    weak var viewController: UIViewController?
    
    static let shared = WelcomeBackRouter()
    
    static func createModule() -> UIViewController {
        let view = WelcomeBackView()
        let presenter = WelcomeBackPresenter()
        let router = WelcomeBackRouter.shared
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        router.viewController = view
        
        let navigationController = UINavigationController(rootViewController: view)
        return navigationController
    }
}


extension WelcomeBackRouter: WelcomeBackRouterProtocol {
    func navigateToForgotPassword() {
        let forgotPasswordView = ForgotPasswordRouter.createModule()
        viewController?.navigationController?.pushViewController(forgotPasswordView, animated: true)
        print("Navigating to forgot password screen/RouterWB")
    }
    
    func navigateToRegistration() {
        let registrationView = RegistrationRouter.createModule()
        viewController?.navigationController?.pushViewController(registrationView, animated: true)
        print("Navigating to registration screen/RouterWB")
    }
    
    func navigateToMainScreen() {
        let homeRouter = HomeRouter.createModule()
        if let navigationController = viewController?.navigationController {
            navigationController.pushViewController(homeRouter, animated: true)
            print("Navigating to main screen/RouterWB")
        } else {
            viewController?.present(homeRouter, animated: true, completion: nil)
            print("Navigating to main screen/RouterWB")
        }
    }
}
