
import UIKit
import Firebase
import FirebaseDatabase

struct Trip {
    let title: String
    let rating: Double
    let location: String
    let price: Double
    let isFavorite: Bool
    let image: UIImage?
}

final class FirebaseDatabaseManager {
    static let shared = FirebaseDatabaseManager()
    let databaseRef = Database.database().reference()
    
    func saveTripsToFirebase(trips: [Trip], completion: @escaping (Error?) -> Void) {
        let dispatchGroup = DispatchGroup()
        var savingError: Error?
        
        for trip in trips {
            dispatchGroup.enter()
            let tripRef = databaseRef.child("trips").childByAutoId()
            let tripData: [String: Any] = [
                "title": trip.title,
                "rating": trip.rating,
                "location": trip.location,
                "price": trip.price,
                "isFavorite": trip.isFavorite,
                "imageURL": trip.image
            ]
            
            tripRef.setValue(tripData) { error, _ in
                if let error = error {
                    print("Error saving trip \(trip.title): \(error)")
                    savingError = error
                } else {
                    print("Trip \(trip.title) saved successfully")
                }
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            completion(savingError)
        }
    }
    
}
