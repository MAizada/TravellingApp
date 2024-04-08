//
//  TopTripModel.swift
//  TravellingApp
//
//  Created by Aizada on 08.04.2024.
//

import UIKit

struct Trip {
    let image: UIImage?
    let title: String
    let rating: Double
    let location: String
    let price: Double
    let isFavorite: Bool

    var favoriteImage: UIImage? {
        return isFavorite ? UIImage(named: "heart_filled") : UIImage(named: "heart")
    }
}
