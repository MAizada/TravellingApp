//
//  HomeInteractor.swift
//  TravellingApp
//
//  Created by Aizada on 29.04.2024.
//

import Foundation

protocol HomeInteractorProtocol: class {
    var presenter: HomePresenterProtocol? { get set } 
    func fetchData()
}

final class HomeInteractor: HomeInteractorProtocol {
    
    weak var presenter: HomePresenterProtocol?
    var firebaseManager: FirebaseDatabaseManager
    
    // MARK: - Initialization
    
    init(firebaseManager: FirebaseDatabaseManager) {
        self.firebaseManager = firebaseManager
    }
    
    // MARK: - HomeInteractorProtocol
    
    func fetchData() {
        firebaseManager.getAllTripsFromFirebase { [weak self] trips, error in
            guard let self = self else { return }
            if let error = error {
                self.presenter?.dataFetchingFailed(with: error)
            } else if let trips = trips {
                self.presenter?.dataFetchedSuccessfully(trips: trips)
            }
        }
    }
}
