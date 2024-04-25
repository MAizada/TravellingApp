//
//  RegistrationInteractor.swift
//  TravellingApp
//
//  Created by Aizada on 29.03.2024.
//

import Foundation

protocol RegistrationInteractorProtocol: AnyObject {
    var presenter: RegistrationPresenterProtocol? { get set }
    
    func registerUser(username: String, password: String)
}

final class RegistrationInteractor: RegistrationInteractorProtocol {
    
    var presenter: RegistrationPresenterProtocol?
    let authManager = AuthenticationManager.shared
    
    func registerUser(username: String, password: String) {
        let loginData = LoginField(email: username, password: password)
        
        authManager.createNewUser(loginData) { [weak self] responseCode in
            switch responseCode.code {
            case 1:
                self?.presenter?.registrationDidSucceed()
            case 0:
                self?.presenter?.registrationDidFail(withError: NSError(domain: "RegistrationError", code: 0, userInfo: nil))
            default:
                break
            }
        }
    }
}
