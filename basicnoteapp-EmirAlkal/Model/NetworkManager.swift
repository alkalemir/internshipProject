//
//  NetworkManager.swift
//  basicnoteapp-EmirAlkal
//
//  Created by Emir Alkal on 2.07.2022.
//

import Foundation
import Alamofire

struct NetworkManager {
    let url: URL
    
    func registerRequest(with registerInfo: Register) {
        AF.request(url, method: .post, parameters: registerInfo, encoder: JSONParameterEncoder.default).response { response in
            debugPrint(response)
        }
    }
}
