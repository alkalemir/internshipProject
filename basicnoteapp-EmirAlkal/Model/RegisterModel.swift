//
//  RegisterModel.swift
//  basicnoteapp-EmirAlkal
//
//  Created by Emir Alkal on 2.07.2022.
//

import Foundation

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

struct ErrorMessage: Codable {
    let message: String
}
