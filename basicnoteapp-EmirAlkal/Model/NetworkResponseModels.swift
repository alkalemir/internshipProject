//
//  NetworkResponseModels.swift
//  basicnoteapp-EmirAlkal
//
//  Created by Emir Alkal on 21.07.2022.
//

import Foundation

struct ForgotResponse: Codable {
    let message: String
}

struct GetNotes: Codable {
    let data: Notes
}

struct Notes: Codable {
    let data: [Note]
    let current_page: Int
}

struct Note: Codable {
    let title: String
    let note: String
}
