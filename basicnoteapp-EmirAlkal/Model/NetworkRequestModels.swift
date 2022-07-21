//
//  LoginModel.swift
//  basicnoteapp-EmirAlkal
//
//  Created by Emir Alkal on 20.07.2022.
//

import Foundation

// MARK: - Register request model
struct Register: Encodable {
    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case email = "email"
        case password = "password"
    }
    let fullName: String
    let email: String
    let password: String
}

// MARK: - Login request model
struct Login: Encodable {
    let email: String
    let password: String
}

// MARK: - Forgot password request model
struct Forgot: Encodable {
    let email: String
}

// MARK: - Error model
struct ErrorMessage: Codable {
    let message: String
}
