//
//  RegistrationRouter.swift
//  TravellingApp
//
//  Created by Aizada on 29.03.2024.
//

import UIKit

protocol RegistrationRouterProtocol: AnyObject {
    var view: UIViewController? { get set }

    static func createModule() -> UIViewController

}

final class RegistrationRouter: RegistrationRouterProtocol {
    
    weak var view: UIViewController?

    static func createModule() -> UIViewController {
        let view = RegistrationView()
        let presenter = RegistrationPresenter()
        let interactor = RegistrationInteractor()
        let router = RegistrationRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.view = view

        return view
    }

}
