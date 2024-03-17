//
//  KeychainManager.swift
//  MangaVault
//
//  Created by Alberto Alegre Bravo on 15/3/24.
//

import Foundation
import Security

final class KeychainManager {
    static let shared = KeychainManager()
    
    private init() {}
    
    func saveValueToKC(value: String) {
        guard let value = value.data(using: .utf8) else { return }
        
        let kcQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "Token",
            kSecValueData as String: value,
            kSecAttrAccessible as String: kSecAttrAccessibleAfterFirstUnlock
        ]
        
        var item: CFTypeRef?
        
        let status = SecItemCopyMatching(kcQuery as CFDictionary, &item)
        
        switch status {
        case errSecSuccess:
            let updateQuery: [String: Any] = [kSecValueData as String: value]
            
            SecItemUpdate(kcQuery as CFDictionary, updateQuery as CFDictionary)
            
        case errSecItemNotFound:
            SecItemAdd(kcQuery as CFDictionary, nil)
        default: break
            
        }
    }
    
    func recoverValueFromKC() -> String? {
        guard let kCFBooleanTrue = kCFBooleanTrue else { return nil }
        
        let kcQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "Token",
            kSecReturnData as String: kCFBooleanTrue,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var item: CFTypeRef?
        SecItemCopyMatching(kcQuery as CFDictionary, &item)
        
        guard let item = item as? Data else { return nil }
        
        return String(data: item, encoding: .utf8)
    }
    
    func removeValueFromKC(value: String) {
        guard let value = value.data(using: .utf8) else { return }
        
        let keychainQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "Token",
            kSecValueData as String: value,
            kSecAttrAccessible as String: kSecAttrAccessibleAfterFirstUnlock
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(keychainQuery as CFDictionary, &item)
        
        switch status {
        case errSecSuccess:
            SecItemDelete(keychainQuery as CFDictionary)
        case errSecItemNotFound:
            SecItemAdd(keychainQuery as CFDictionary, nil)
        default:
            break
        }
    }
    
    func removeValueFromKC2() {
        
        let keychainQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "Token",
            kSecAttrAccessible as String: kSecAttrAccessibleAfterFirstUnlock
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(keychainQuery as CFDictionary, &item)
        
        switch status {
        case errSecSuccess:
            SecItemDelete(keychainQuery as CFDictionary)
        case errSecItemNotFound:
            SecItemAdd(keychainQuery as CFDictionary, nil)
        default:
            break
        }
    }
}
