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
    
    var body: some Scene {
        WindowGroup {
            LoginMainView()
                .environmentObject(loginViewModel)
        }
    }
}
