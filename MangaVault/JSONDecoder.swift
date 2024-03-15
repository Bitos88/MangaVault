//
//  JSONDecoder.swift
//  MangaVault
//
//  Created by Alberto Alegre Bravo on 15/3/24.
//

import Foundation

func getJSON<JSON>(request: URLRequest, type: JSON.Type) async throws -> JSON where JSON: Codable {
    let (data, response) = try await URLSession.shared.getData(for: request)
    
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .formatted(.dateFormatCustom)
    
    
    if response.statusCode == 200 {
        do {
            return try decoder.decode(type, from: data)
        } catch {
            throw NetworkError.json(error)
        }
    } else {
        throw NetworkError.status(response.statusCode)
    }
}
