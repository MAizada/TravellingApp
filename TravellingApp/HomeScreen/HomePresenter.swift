//
//  HomePresenter.swift
//  TravellingApp
//
//  Created by Aizada on 29.04.2024.
//

import Foundation

protocol HomePresenterProtocol: class {
    func fetchData()
    func dataFetchedSuccessfully(trips: [Trip])
    func dataFetchingFailed(with error: Error)
}

final class HomePresenter: HomePresenterProtocol {
    
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
    
    // MARK: - Initialization
    
    init(view: HomeViewProtocol, interactor: HomeInteractorProtocol, router: HomeRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        
        self.interactor?.presenter = self
    }
    
    // MARK: - HomePresenterProtocol
    
    func viewDidLoad() {
        fetchData()
    }
    
    func fetchData() {
        interactor?.fetchData()
    }
    
    func dataFetchedSuccessfully(trips: [Trip]) {
        view?.displayTrips(trips)
    }
    
    func dataFetchingFailed(with error: Error) {
    }
}
