
import Foundation

protocol RegistrationInteractorProtocol: AnyObject {
    var presenter: RegistrationPresenterProtocol? { get set }
    
    func registerUser(username: String, password: String)
    func showMissingFieldsError()
    func showEmailExistsError()
    func showGenericError()
}

final class RegistrationInteractor: RegistrationInteractorProtocol {
    
    var presenter: RegistrationPresenterProtocol?
    let authManager = AuthenticationManager.shared
    
    func registerUser(username: String, password: String) {
        guard !username.isEmpty, !password.isEmpty else {
            showMissingFieldsError()
            return
        }
        
        let loginData = LoginField(email: username, password: password)
        
        authManager.createNewUser(loginData) { [weak self] responseCode in
            switch responseCode.code {
            case 1:
                self?.presenter?.registrationDidSucceed()
                print("User registration successful")
            case 0:
                self?.showEmailExistsError()
                print("An account with this email already exists")
            default:
                self?.showGenericError()
                print("An error occurred during registration")
            }
        }
    }
    
    func showMissingFieldsError() {
        let error = NSError(domain: "RegistrationError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Please fill in all fields"])
        presenter?.registrationDidFail(withError: error)
    }
    
    func showEmailExistsError() {
        let error = NSError(domain: "RegistrationError", code: 0, userInfo: [NSLocalizedDescriptionKey: "An account with this email already exists"])
        presenter?.registrationDidFail(withError: error)
    }
    
    func showGenericError() {
        let error = NSError(domain: "RegistrationError", code: 0, userInfo: [NSLocalizedDescriptionKey: "An error occurred during registration"])
        presenter?.registrationDidFail(withError: error)
    }}
