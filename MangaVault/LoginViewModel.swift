//
//  LoginViewModel.swift
//  MangaVault
//
//  Created by Alberto Alegre Bravo on 15/3/24.
//

import Foundation

enum LoginViewState {
    case login
    case register
}

final class LoginViewModel: ObservableObject {
    let interactor: LoginInteractorProtocol
    @Published var loginViewState: LoginViewState = .login
    @Published var username: String = ""
    @Published var password: String = ""
    
    init(interactor: LoginInteractorProtocol = LoginInteractor()) {
        self.interactor = interactor
    }
}
