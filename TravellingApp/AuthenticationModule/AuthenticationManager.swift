//
//  AuthenticationManager.swift
//  TravellingApp
//
//  Created by Aizada on 24.04.2024.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase

final class AuthenticationManager {
    
    static let shared = AuthenticationManager()
    let auth = Auth.auth()
    var allTransactions: [Transaction] = []
    
    private func configueFB() -> Firestore {
        var db: Firestore!
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        return db
    }
    
    //MARK: - Users
    func createNewUser(_ data: LoginField, completion: @escaping (ResponseCode) -> () ) {
        
        auth.createUser(withEmail: data.email, password: data.password) { [weak self] result, error in
            
            if error == nil {
                if result != nil {
                    let userId = result?.user.uid
                    let email = data.email
                }
            } else {
                
            }
        }
    }
    
    func authInApp(_ data: LoginField, completion: @escaping (AuthResponce) -> ()) {
        auth.signIn(withEmail: data.email, password: data.password) { result, error in
            if error != nil {
                completion(.error)
            } else {
                if let result = result {
                    completion(.success)
                }
            }
        }
    }
    
    func getAllUsers(completion: @escaping ([CurrentUser]) -> ()) {
        
        guard let email = auth.currentUser?.email else { return }
        
        var currentUsers = [CurrentUser]()
        Firestore.firestore().collection("users")
            .whereField("email", isNotEqualTo: email)
            .getDocuments { snapshot, error in
                if error == nil {
                    
                    if let documents = snapshot?.documents {
                        for document in documents {
                            let data = document.data()
                            let userId = document.documentID
                            let email = data["email"] as! String
                            currentUsers.append(CurrentUser(id: userId, email: email))
                        }
                    }
                    completion(currentUsers)
                }
            }
    }
    
    func getUsername(completion: @escaping (String?) -> Void) {
        if let currentUser = Auth.auth().currentUser {
            let username = currentUser.displayName
            completion(username)
        } else {
            completion(nil)
        }
    }
    
    //MARK: - Logout
    public func logout(completion: @escaping (Result<(), Error>) -> ()) {
        do {
            try Auth.auth().signOut()
            completion(.success(()))
        } catch let error {
            completion(.failure(error))
        }
    }
}
