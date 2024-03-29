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

    
    func registerUser(username: String, password: String) {
   
    }
}
