//
//  DateFormatter.swift
//  MangaVault
//
//  Created by Alberto Alegre Bravo on 15/3/24.
//

import Foundation

extension DateFormatter {
    static let dateFormatCustom = {
        let date = DateFormatter()
        date.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return date
    }()
}
