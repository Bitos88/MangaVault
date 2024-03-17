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
    var loginError = "Usuario o contraseña incorrectos"
    
    @Published var loginViewState: LoginViewState = .login
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var repeatPassword: String = ""
    @Published var showLoginError = false
    @Published var loginUserOK = false
    
    init(interactor: LoginInteractorProtocol = LoginInteractor()) {
        self.interactor = interactor
    }
    
    func loginUser() async {
        do {
            try await interactor.loginUser(username: email, password: password)
            
            await MainActor.run {
                loginUserOK.toggle()
                loggedUser = true
                resetTextfields()
            }
        } catch {
            await MainActor.run {
                loggedUser = false
                showLoginError.toggle()
            }
        }
    }
    
    func registerUser() async {
        guard !email.isEmpty,
              !password.isEmpty,
              password == repeatPassword,
              email.isValidEmail() else { return }
        
        let newUser = UserModel(email: email, password: password)
        
        do {
            try await interactor.registerUser(user: newUser)
            
            await MainActor.run {
                loginViewState = .login
                resetTextfields()
                email = newUser.email
                print("REGISTER OK")
            }
        } catch {
            //TODO: ADD ALERT
            print("REGISTER ERROR: \(error)")
        }
    }
    
    func resetTextfields() {
        email = ""
        password = ""
        repeatPassword = ""
    }
    
    
}
