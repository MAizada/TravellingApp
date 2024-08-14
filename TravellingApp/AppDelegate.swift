//
//  AppDelegate.swift
//  TravellingApp
//
//  Created by Aizada on 25.03.2024.
//
import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        let firebaseManager = FirebaseDatabaseManager.shared
        print("Firebase configured successfully")

        let rememberMeEnabled = UserDefaults.standard.bool(forKey: "RememberMe")
        if rememberMeEnabled {
            let userEmail = UserDefaults.standard.string(forKey: "UserEmail")
            let userPassword = UserDefaults.standard.string(forKey: "UserPassword")
            if let email = userEmail, let password = userPassword {
                let interactor = WelcomeBackInteractor()
                interactor.login(email: email, password: password) { result in
                    switch result {
                    case .success:
                        print("User logged in successfully")
                    case .failure(let error):
                        print("Error logging in: \(error.localizedDescription)")
                    }
                }
            }
        }

        // Create an instance of your TabBarController
        let tabBarController = TabBarController()

        // Set up the root view controller of the window
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
}




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
