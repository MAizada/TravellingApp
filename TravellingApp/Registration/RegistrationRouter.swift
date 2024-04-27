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
    func navigateToMainScreen()
    func showError(_ error: Error)

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

    func navigateToMainScreen() {
        let homeVC = HomeView()  
        view?.navigationController?.pushViewController(homeVC, animated: true)
        print("Navigating to main screen")
    }

    func showError(_ error: Error) {
        let alertController = UIAlertController(title: "Ошибка", message: error.localizedDescription, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        view?.present(alertController, animated: true, completion: nil)
        print("Showing error: \(error.localizedDescription)")
    }
}
