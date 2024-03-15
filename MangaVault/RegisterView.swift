//
//  RegisterView.swift
//  MangaVault
//
//  Created by Alberto Alegre Bravo on 15/3/24.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var vm: LoginViewModel

    var body: some View {
        VStack {
            Text("Register new user")
                .font(.title)
                .padding()
            CustomTextField(title: "Username", value: $vm.username)
            CustomTextField(title: "Password", value: $vm.password, textfieldStyle: .secure)
            
            Button(action: {
                
            }, label: {
                Text("Confirm")
            })
            .foregroundStyle(Color.white)
            .frame(width: 100)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Button(action: {
                withAnimation(.bouncy) {
                    vm.loginViewState = .login
                }
            }, label: {
                HStack {
                    Image(systemName: "arrowshape.turn.up.left")
                    Text("Back to login")
                }
            })
            .padding()
        }
        .padding()

    }
}

#Preview {
    RegisterView()
        .environmentObject(LoginViewModel())
}
