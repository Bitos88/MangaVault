//
//  LoginView.swift
//  MangaVault
//
//  Created by Alberto Alegre Bravo on 15/3/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var vm: LoginViewModel
    
    var body: some View {
        VStack {
            Text("Manga Vault")
                .font(.title)
            CustomTextField(title: "Email", value: $vm.email)
            CustomTextField(title: "Password", value: $vm.password, textfieldStyle: .secure)
            
            Button(action: {
                Task {
                    await vm.loginUser()
                }
            }, label: {
                Text("Login")
            })
            .foregroundStyle(Color.white)
            .frame(width: 100)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack {
                Text("New here?")
                Button(action: {
                    withAnimation(.bouncy) {
                        vm.loginViewState = .register
                    }
                }, label: {
                    Text("Register")
                })
            }
        }
        .alert(vm.loginError, isPresented: $vm.showLoginError, actions: {}, message: {
            Text("Compruebe sus datos")
        })
        .padding()
    }
}

#Preview {
    LoginView()
        .environmentObject(LoginViewModel())
}
