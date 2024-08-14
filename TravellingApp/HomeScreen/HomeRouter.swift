//
//  HomeRouter.swift
//  TravellingApp
//
//  Created by Aizada on 29.04.2024.
//

import UIKit

protocol HomeRouterProtocol: AnyObject {
    func navigateToNotification()
    func presentFilterView()
    func navigateToTripDetail(with trip: Trip, tripDetailCategories: [TripDetailCatrgories])
}

final class HomeRouter: HomeRouterProtocol {
    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
            let view = HomeView() 
            let router = HomeRouter(viewController: view)
            
            view.router = router
            router.viewController = view
            
            let navigationController = UINavigationController(rootViewController: view)
            return navigationController
        }
        
    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func navigateToNotification() {
        let notificationView = NotificationView()
        viewController?.navigationController?.pushViewController(notificationView, animated: true)
    }

    func presentFilterView() {
        let filterView = FilterView()
        viewController?.present(filterView, animated: true, completion: nil)
    }

    func navigateToTripDetail(with trip: Trip, tripDetailCategories: [TripDetailCatrgories]) {
        let tripDetailVC = TripDetailView()
        tripDetailVC.trip = trip
        tripDetailVC.tripDetailCategories = tripDetailCategories
        viewController?.navigationController?.pushViewController(tripDetailVC, animated: true)
    }
}
