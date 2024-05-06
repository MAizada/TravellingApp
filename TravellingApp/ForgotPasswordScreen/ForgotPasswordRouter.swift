//
//  ForgotPasswordRouter.swift
//  TravellingApp
//
//  Created by Aizada on 06.05.2024.
//

import UIKit

protocol ForgotPasswordRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}


final class ForgotPasswordRouter: ForgotPasswordRouterProtocol {
    static func createModule() -> UIViewController {
        let view = ForgotPasswordView()
        let interactor = ForgotPasswordInteractor()
        let presenter = ForgotPasswordPresenter()
        let router = ForgotPasswordRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}
