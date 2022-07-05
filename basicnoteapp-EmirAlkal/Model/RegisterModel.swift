//
//  RegisterModel.swift
//  basicnoteapp-EmirAlkal
//
//  Created by Emir Alkal on 2.07.2022.
//

import Foundation

struct Register: Encodable {
    
    let full_name: String
    let email: String
    let password: String
}
