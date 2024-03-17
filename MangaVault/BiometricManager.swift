//
//  BiometricManager.swift
//  MangaVault
//
//  Created by Alberto Alegre Bravo on 17/3/24.
//

import Foundation
import LocalAuthentication

final class BiometricManager {
    static let shared = BiometricManager()
    
    var context = LAContext()
    var error: NSError?
    
    func faceID() {
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            let reason = "Authenticate to access the app"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason){ success, authenticationError in
                if success{
                    print("successed")
                    
                }else{
                    print("failed")
                }
            }
        }else {
            // Device does not support Face ID or Touch ID
            print("Biometric authentication unavailable")
        }
    }
}
