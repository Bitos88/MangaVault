//
//  MyCollectionViewModel.swift
//  MangaVault
//
//  Created by Alberto Alegre Bravo on 16/3/24.
//

import SwiftUI

final class MyCollectionViewModel: ObservableObject {
    @AppStorage("userLogged") private var loggedUser = false
    let keychainManager = KeychainManager.shared
    let interactor: MyCollectionInteractorProtocol
    @Published var mangas: [MangasResult] = []
    
    init(interactor: MyCollectionInteractorProtocol = MyCollectionInteractor()) {
        self.interactor = interactor
        
        Task { await fetchMangas() }
    }
    
    func fetchMangas() async {
        do {
            let mangas = try await interactor.getMyCollection()
            
            await MainActor.run {
                self.mangas = mangas
            }
        } catch let error as NetworkError {
            print("Error1")
            print(error)
        } catch {
            print("Error2")

            print(error)
        }
    }
    
    //MARK: PROVISIONAL
    
    func logout() {
        loggedUser = false
        keychainManager.removeValueFromKC2()
    }
}


struct MangasResult: Codable, Hashable, Identifiable {
    let id: String
    let manga: MangaModel
}

struct MangaModel: Codable, Hashable {
    let title: String
}

struct NewManga: Codable {
    let manga: Int
    let completeCollection: Bool
    let volumesOwned: [Int]
    let readingVolume: Int
}

extension URL {
    static let mainURL = URL(string: "https://mymanga-acacademy-5607149ebe3d.herokuapp.com/collection/manga")!
}
