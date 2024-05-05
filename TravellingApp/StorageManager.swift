
import UIKit
import Firebase
import FirebaseDatabase

struct Trip {
    let title: String
    let rating: Double
    let location: String
    let price: Double
    let isFavorite: Bool
    var imageURL: URL?
}

final class FirebaseDatabaseManager {
    static let shared = FirebaseDatabaseManager()
    let databaseRef = Database.database().reference()
    
    // Сохранение списка поездок в Firebase
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
                "imageURL": trip.imageURL?.absoluteString ?? ""
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
    
    // Получение списка поездок из Firebase
    func getAllTripsFromFirebase(completion: @escaping ([Trip]?, Error?) -> Void) {
        databaseRef.child("trips").observeSingleEvent(of: .value, with: { snapshot in
            guard let tripDicts = snapshot.value as? [String: Any] else {
                completion(nil, nil)
                return
            }
            
            let trips = tripDicts.compactMap { (key, value) -> Trip? in
                guard let tripData = value as? [String: Any],
                      let title = tripData["title"] as? String,
                      let rating = tripData["rating"] as? Double,
                      let location = tripData["location"] as? String,
                      let price = tripData["price"] as? Double,
                      let isFavorite = tripData["isFavorite"] as? Bool,
                      let imageURLString = tripData["imageURL"] as? String,
                      let imageURL = URL(string: imageURLString) else {
                    return nil
                }
                
                return Trip(title: title, rating: rating, location: location, price: price, isFavorite: isFavorite, imageURL: imageURL)
            }
            
            completion(trips, nil)
        }) { error in
            completion(nil, error)
        }
    }
}
