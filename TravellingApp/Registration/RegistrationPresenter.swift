
import Foundation

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
        view?.showRegistrationError(error)
        print("User registration failed: \(error.localizedDescription)")
    }
}
