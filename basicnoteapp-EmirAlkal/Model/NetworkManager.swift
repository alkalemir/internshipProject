//
//  NetworkManager.swift
//  basicnoteapp-EmirAlkal
//
//  Created by Emir Alkal on 2.07.2022.
//

import Foundation
import Alamofire

// swiftlint: disable all

struct NetworkManager {
    let url: URL
    
    func registerRequest(with registerInfo: Register, completion: @escaping (String) -> Void) {
        AF.request(url, method: .post, parameters: registerInfo, encoder: JSONParameterEncoder.default).response { response in
            
            if let statusCode = response.response?.statusCode {
                if statusCode == 400 {
                    let actualData = try! JSONDecoder().decode(ErrorMessage.self, from: response.data!)
                    completion(actualData.message)
                    return
                }
            }
            
            if let data = response.data {
                let actualData = try! JSONDecoder().decode(RegisterResponse.self, from: data)
                KeychainWrapper.standard.set(actualData.data.access_token, forKey: "token")
            }
        }
    }
}
