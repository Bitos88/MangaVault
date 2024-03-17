//
//  LoginInteractor.swift
//  MangaVault
//
//  Created by Alberto Alegre Bravo on 15/3/24.
//

import Foundation

protocol LoginInteractorProtocol {
    func loginUser(username: String, password: String) async throws
    func registerUser(user: UserModel) async throws
}

struct LoginInteractor: LoginInteractorProtocol {
    let keychain = KeychainManager.shared
    
    func loginUser(username: String, password: String) async throws {
       let (data, response) = try await URLSession.shared.data(for: .loginUserRequest(username: username, password: password))
        
        guard let response = response as? HTTPURLResponse else {
            throw NetworkError.noHTTP
        }
        
        switch response.statusCode {
        case 200:
            if let token = String(data: data, encoding: .utf8) {
                keychain.saveValueToKC(value: token)
            }
        default:
            throw NetworkError.status(response.statusCode)
        }
    }
    
    func registerUser(user: UserModel) async throws {
        let (_, response) = try await URLSession.shared.data(for: .registerUserRequest(user: user))
         
         guard let response = response as? HTTPURLResponse else {
             throw NetworkError.noHTTP
         }
         
        guard response.statusCode == 201 else {
            throw NetworkError.status(response.statusCode)
        }
    }
}
