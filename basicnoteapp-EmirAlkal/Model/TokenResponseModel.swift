//
//  RegisterResponseModel.swift
//  basicnoteapp-EmirAlkal
//
//  Created by Emir Alkal on 2.07.2022.
//

import Foundation

struct TokenResponse: Codable {
    let data: Token
}

struct Token: Codable {
    let access_token: String
}
