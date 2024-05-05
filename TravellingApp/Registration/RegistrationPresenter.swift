
import Foundation

enum RegistrationError: Error {
    case missingFields
    case emailExists
    case generic
}

protocol RegistrationPresenterProtocol: AnyObject {
    var view: RegistrationViewProtocol? { get set }
    var interactor: RegistrationInteractorProtocol? { get set }
    var router: RegistrationRouterProtocol? { get set }
    
    func registerUser(username: String, password: String)
    func registrationDidSucceed()
    func registrationDidFail(withError error: Error)
}

final class RegistrationPresenter: RegistrationPresenterProtocol {
    
    var view: RegistrationViewProtocol?
    var interactor: RegistrationInteractorProtocol?
    var router: RegistrationRouterProtocol?
    
    func registerUser(username: String, password: String) {
        interactor?.registerUser(username: username, password: password)
    }
    
    func registrationDidSucceed() {
        router?.navigateToMainScreen()
        print("User registration success, navigating to main screen")
    }
    
    func registrationDidFail(withError error: Error) {
        if let registrationError = error as? RegistrationError {
            switch registrationError {
            case .missingFields:
                showMissingFieldsError()
            case .emailExists:
                showEmailExistsError()
            case .generic:
                showGenericError()
            }
        } else {
            showGenericError()
        }
    }
    
    private func showMissingFieldsError() {
        let error = NSError(domain: "RegistrationError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Please fill in all fields"])
        view?.showRegistrationError(error)
        print("User registration failed: \(error.localizedDescription)")
    }

    private func showEmailExistsError() {
        let error = NSError(domain: "RegistrationError", code: 0, userInfo: [NSLocalizedDescriptionKey: "An account with this email already exists"])
        view?.showRegistrationError(error)
        print("User registration failed: \(error.localizedDescription)")
    }

    private func showGenericError() {
        let error = NSError(domain: "RegistrationError", code: 0, userInfo: [NSLocalizedDescriptionKey: "An error occurred during registration"])
        view?.showRegistrationError(error)
        print("User registration failed: \(error.localizedDescription)")
    }
}
