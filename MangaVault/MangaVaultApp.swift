//
//  MangaVaultApp.swift
//  MangaVault
//
//  Created by Alberto Alegre Bravo on 15/3/24.
//

import SwiftUI

@main
struct MangaVaultApp: App {
    @StateObject var loginViewModel = LoginViewModel()
    @AppStorage("userLogged") private var loggedUser = false

    var body: some Scene {
        WindowGroup {
            if loggedUser {
                MyCollectionView()
            } else {
                LoginMainView()
                    .environmentObject(loginViewModel)
            }
        }
    }
}
