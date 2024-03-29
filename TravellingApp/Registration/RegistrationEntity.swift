//
//  RegistrationEntity.swift
//  TravellingApp
//
//  Created by Aizada on 29.03.2024.
//

import Foundation

protocol RegistrationEntityProtocol {
    var username: String { get }
    var password: String { get }
}

struct RegistrationEntity {
    let username: String
    let password: String
}
