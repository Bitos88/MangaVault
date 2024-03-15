//
//  LoginMainView.swift
//  MangaVault
//
//  Created by Alberto Alegre Bravo on 15/3/24.
//

import SwiftUI

struct LoginMainView: View {
    @EnvironmentObject var viewModel: LoginViewModel
    
    var body: some View {
        switch viewModel.loginViewState {
        case .login:
            LoginView()
        case .register:
            RegisterView()
        }
    }
}

#Preview {
    LoginMainView()
        .environmentObject(LoginViewModel())
}
