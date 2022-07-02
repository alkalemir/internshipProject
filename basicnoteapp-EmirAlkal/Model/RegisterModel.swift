//
//  RegisterModel.swift
//  basicnoteapp-EmirAlkal
//
//  Created by Emir Alkal on 2.07.2022.
//

import Foundation

// swiftlint: disable all

struct Register: Encodable {
    let full_name: String
    let email: String
    let password: String
}
