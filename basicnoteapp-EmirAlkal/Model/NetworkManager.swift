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
    
    func registerRequest(with registerInfo: Register, completion: @escaping (String) -> Void, onSuccess: @escaping () -> Void) {
        AF.request(url, method: .post, parameters: registerInfo, encoder: JSONParameterEncoder.default).response { response in
            
            if let statusCode = response.response?.statusCode {
                if statusCode == 400 {
                    do {
                        let actualData = try JSONDecoder().decode(ErrorMessage.self, from: response.data!)
                        completion(actualData.message)
                        return
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            
            if let data = response.data {
                do {
                    let actualData = try JSONDecoder().decode(TokenResponse.self, from: data)
                    KeychainWrapper.standard.set(actualData.data.access_token, forKey: "token")
                    onSuccess()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func loginRequest(with loginInfo: Login, completion: @escaping (String) -> Void, onSuccess: @escaping (Token) -> Void) {
        AF.request(url, method: .post, parameters: loginInfo, encoder: JSONParameterEncoder.default).response { response in
            if let statusCode = response.response?.statusCode {
                if statusCode == 400 {
                    do {
                        let actualData = try JSONDecoder().decode(ErrorMessage.self, from: response.data!)
                        completion(actualData.message)
                        return
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            
            if let data = response.data {
                do {
                    let actualData = try JSONDecoder().decode(TokenResponse.self, from: data)
                    KeychainWrapper.standard.set(actualData.data.access_token, forKey: "token")
                    onSuccess(actualData.data)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func forgotPasswordRequest(email: Forgot, completion: @escaping (String) -> Void, onSuccess: @escaping (ForgotResponse) -> Void) {

        AF.request(url, method: .post, parameters: email, encoder: JSONParameterEncoder.default).response { response in
            if let statusCode = response.response?.statusCode {
                if statusCode == 400 {
                    do {
                        let actualData = try JSONDecoder().decode(ErrorMessage.self, from: response.data!)
                        completion(actualData.message)
                        return
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            if let data = response.data {
                do {
                    let actualData = try JSONDecoder().decode(ForgotResponse.self, from: data)
                    onSuccess(actualData)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func getNotes(completion: @escaping (GetNotes) -> Void) {
        let headers: HTTPHeaders = [.authorization(bearerToken: currentToken)]
    
        AF.request(url, method: .get, headers: headers).response { response in
            
            if let data = response.data {
                do {
                    let actualData = try JSONDecoder().decode(GetNotes.self, from: data)
                    completion(actualData)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func addNote(note: Note, completion: @escaping () -> Void) {
        let headers: HTTPHeaders = [.authorization(bearerToken: currentToken)]
        
        AF.request(url, method: .post, parameters: note, encoder: JSONParameterEncoder.default, headers: headers).response { _ in
            completion()
        }
    }
}
