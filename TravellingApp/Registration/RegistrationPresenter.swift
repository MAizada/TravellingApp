//
//  RegistrationPresenter.swift
//  TravellingApp
//
//  Created by Aizada on 29.03.2024.
//

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
     
    }

    func registrationDidFail(withError error: Error) {

    }
}
