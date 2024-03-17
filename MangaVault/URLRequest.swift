//
//  URLRequest.swift
//  MangaVault
//
//  Created by Alberto Alegre Bravo on 15/3/24.
//

import Foundation

extension URLRequest {
    static func get(url: URL, page: Int = 1, per: Int = 30) -> URLRequest {
        var request = URLRequest(url: url)
        
        request.url?.append(queryItems: [URLQueryItem(name: "page", value: String(page))])
        request.url?.append(queryItems: [URLQueryItem(name: "per", value: String(per))])
        
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        return request
    }
    
    static func searchManga(url: URL, contains: String, page: Int = 1) -> URLRequest {
        var request = URLRequest(url: url.appending(path: contains))
                
        request.url?.append(queryItems: [URLQueryItem(name: "page", value: String(page))])
        
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        return request
    }
    
    static func searchByAuthor(url: URL, id: UUID, page: Int, per: Int = 10) -> URLRequest {
        var request = URLRequest(url: url.appending(path: "\(id)"))
        
        request.url?.append(queryItems: [URLQueryItem(name: "page", value: String(page))])
        request.url?.append(queryItems: [URLQueryItem(name: "per", value: String(per))])
        
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        return request
    }
    
    static func loginUserRequest(username: String, password: String) -> URLRequest {
        var request = URLRequest(url: .loginUserURL)
        
        let credentials = "\(username):\(password)"
        
        let auth2 = "Basic \(credentials.data(using: .utf8)!.base64EncodedString())"
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("*/*", forHTTPHeaderField: "Accept")
        request.setValue("sLGH38NhEJ0_anlIWwhsz1-LarClEohiAHQqayF0FY", forHTTPHeaderField: "App-Token")
        request.setValue(auth2, forHTTPHeaderField: "Authorization")
        
        return request
    }
    
    static func myCollectionRequest(token: String) -> URLRequest {
        var request = URLRequest(url: .myCollectionURL)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("*/*", forHTTPHeaderField: "Accept")
        request.setValue("sLGH38NhEJ0_anlIWwhsz1-LarClEohiAHQqayF0FY", forHTTPHeaderField: "App-Token")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        return request
    }
}
