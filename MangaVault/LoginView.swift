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
            CustomTextField(title: "Username", value: $vm.username)
            CustomTextField(title: "Password", value: $vm.password, textfieldStyle: .secure)
            
            Button(action: {
                
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
        .padding()
    }
}

#Preview {
    LoginView()
        .environmentObject(LoginViewModel())
}
