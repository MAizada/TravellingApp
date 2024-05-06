//
//  AppDelegate.swift
//  TravellingApp
//
//  Created by Aizada on 25.03.2024.
//
import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase
import FirebaseFirestore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
   
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        var firebaseManager = FirebaseDatabaseManager.shared
        print("Firebase configured successfully")
        
        let homeView = HomeView()
        let router = HomeRouter(viewController: homeView)
        let presenter = HomePresenter(view: homeView, interactor: HomeInteractor(firebaseManager: firebaseManager), router: router)
        homeView.presenter = presenter
        
        firebaseManager.getAllTripsFromFirebase { trips, error in
            if let error = error {
                print("Error loading trips from Firebase: \(error.localizedDescription)")
            } else if let trips = trips {
                homeView.displayedTrips = trips
                homeView.tripsCollectionView.reloadData()
            }
        }
        
        let navController = UINavigationController(rootViewController: homeView)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }
}










// Список поездок
//let trips: [Trip] = [
//    Trip(title: "RedFish Lake", rating: 4.5, location: "Idaho", price: 40, isFavorite: true, imageURL: URL(string: "RedFishLake.jpg")),
//    Trip(title: "Maligne Lake", rating: 4.8, location: "Canada", price: 40, isFavorite: true, imageURL: URL(string: "MaligneLake.jpg")),
//    Trip(title: "Kolsay Lake", rating: 4.8, location: "Kazakhstan", price: 40, isFavorite: true, imageURL: URL(string: "kolsayLake.jpg")),
//]


//
//let groupTrips: [GroupTrip] = [
//    GroupTrip(title: "Mountain Trip", secondTitle: "Seelisburg", location: "Norway", image: UIImage(named: "mountainTrip")!)
//]
//
//var tripDetailCategories: [TripDetailCatrgories] = [
//    TripDetailCatrgories(title: "Lake View", secondTitle: "RedFish Lake", image: UIImage(named: "RedFish")!, rating: 4.5, location: "Idaho", information: """
//    What is Redfish Lake known for?
//    Redfish Lake is the final stop on the longest
//    Pacific salmon run in North America, which
//    requires long-distance swimmers, such as
//    Sockeye and Chinook Salmon, to travel over
//    900 miles upstream to return to their spawning
//    grounds.
//    Redfish Lake is an alpine lake in Custer County,
//    Idaho, just south of Stanley. It is the largest lake
//    within the Sawtooth National Recreation Area.
//    """),
//    TripDetailCatrgories(title: "Lake View", secondTitle: "Maligne Lake", image: UIImage(named: "MaligneLake")!, rating: 4.5, location: "Canada", information: """
//    Maligne Lake is fed and drained by the Maligne River,
//    which enters the lake on its south side,
//    near Mount Unwin and drains the lake to the north.
//    Maligne Lake, as well as Maligne River, Maligne Mountain,
//    and Maligne Pass, takes its name from
//    the French word for malignant or wicked.
//    """),
//    TripDetailCatrgories(title: "Lake View", secondTitle: "Kolsay Lake", image: UIImage(named: "kolsayLake")!, rating: 4.5, location: "Kazakhstan", information: """
//    There are guest-houses and campsites
//    in the nearby village of Saty.
//    There is a 25 km hiking route that begins
//    at the lower lake, progresses by the
//    Kolsay lakes, and moves over the Sary-Bulak
//    pass (3,278 m). The route takes three days
//    by foot, or one day by horse. Kolsay Lakes are
//    a popular mountain tourism destination in the
//    region. Hiking trails to Kolsay Lakes are
//    relatively accessible for beginners.
//    Popular activities in the area include picnics,
//    horse riding, and mountain biking.
//    April to late September are standard periods
//    for camping in the area.
//    """)
//]
