//
//  WelcomeBackInteractor.swift
//  TravellingApp
//
//  Created by Aizada on 06.05.2024.
//

import Foundation
import FirebaseAuth

protocol WelcomeBackInteractorProtocol: AnyObject {
    
    func login(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void)
}

final class WelcomeBackInteractor: WelcomeBackInteractorProtocol {
    
    func login(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        print("Attempting to log in with email/InteractorWB: \(email)")
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                print("Login failed with error/InteractorWB: \(error.localizedDescription)")
                completion(.failure(error))
            } else {
                print("Login successful/InteractorWB")
                completion(.success(()))
            }
        }
    }
}
