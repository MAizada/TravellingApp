//
//  AuthenticationModels.swift
//  TravellingApp
//
//  Created by Aizada on 24.04.2024.
//

import Foundation

enum AuthResponce {
    case success, noVerify, error
}

struct LoginField {
    var email: String
    var password: String
}

struct ResponseCode {
    var code: Int
}

struct CurrentUser {
    var id: String
    var email: String
}

struct User {
    let name: String
    let email: String
    let password: String
}
