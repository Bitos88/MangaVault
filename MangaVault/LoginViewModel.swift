//
//  LoginViewModel.swift
//  MangaVault
//
//  Created by Alberto Alegre Bravo on 15/3/24.
//

import SwiftUI

enum LoginViewState {
    case login
    case register
}

final class LoginViewModel: ObservableObject {
    @AppStorage("userLogged") private var loggedUser = false
    let interactor: LoginInteractorProtocol
    let keychain = KeychainManager.shared
    
    @Published var loginViewState: LoginViewState = .login
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var loginUserOK = false
    
    init(interactor: LoginInteractorProtocol = LoginInteractor()) {
        self.interactor = interactor
    }
    
    func loginUser() async {
        do {
            if try await interactor.loginUser(username: username, password: password) {
                await MainActor.run {
                    loginUserOK.toggle()
                    loggedUser = true
                }
            }
        } catch {
            loggedUser = false
            print("mierror \(error)")
        }
    }
}
