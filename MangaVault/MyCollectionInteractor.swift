//
//  MyCollectionInteractor.swift
//  MangaVault
//
//  Created by Alberto Alegre Bravo on 16/3/24.
//

import Foundation

protocol MyCollectionInteractorProtocol {
    func getMyCollection() async throws -> [MangasResult]
}

struct MyCollectionInteractor: MyCollectionInteractorProtocol {
    let keychainManager = KeychainManager.shared
    
    func getMyCollection() async throws -> [MangasResult] {
        guard let token = keychainManager.recoverValueFromKC() else { return [] }
        
        return try await getJSON(request: .myCollectionRequest(token: token), type: [MangasResult].self)
    }
}
