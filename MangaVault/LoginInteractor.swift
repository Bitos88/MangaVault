//
//  LoginInteractor.swift
//  MangaVault
//
//  Created by Alberto Alegre Bravo on 15/3/24.
//

import Foundation

protocol LoginInteractorProtocol {
    func loginUser(username: String, password: String) async throws -> Bool
    func registerUser() async throws -> Bool
}

struct LoginInteractor: LoginInteractorProtocol {
    let keychain = KeychainManager.shared
    
    func loginUser(username: String, password: String) async throws -> Bool {
       let (data, response) = try await URLSession.shared.data(for: .loginUserRequest(username: username, password: password))
        
        guard let response = response as? HTTPURLResponse else {
            throw NetworkError.noHTTP
        }
        
        if let token = String(data: data, encoding: .utf8) {
            keychain.saveValueToKC(value: token)
            print(token)
        }
        
        print(response.statusCode)
        
        return response.statusCode == 200 ? true : false
    }
    
    func registerUser() async throws -> Bool {
        return true
    }
    
    
}
