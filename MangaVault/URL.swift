//
//  URL.swift
//  MangaVault
//
//  Created by Alberto Alegre Bravo on 15/3/24.
//

import Foundation

let api = URL(string: "https://mymanga-acacademy-5607149ebe3d.herokuapp.com/list/")!
let searchAPI = URL(string: "https://mymanga-acacademy-5607149ebe3d.herokuapp.com/search/")!
let loginAPI = URL(string: "https://mymanga-acacademy-5607149ebe3d.herokuapp.com/users/")!
let collectionAPI = URL(string: "https://mymanga-acacademy-5607149ebe3d.herokuapp.com/collection/manga")!

//https://mymanga-acacademy-5607149ebe3d.herokuapp.com/list/mangaByAuthor/998C1B16-E3DB-47D1-8157-8389B5345D03?page=1&per=20

extension URL {
    static let mangas = api.appending(path: "mangas")
    static let genresURL = api.appending(path: "genres")
    static let byAuthorURL = api.appending(path: "mangaByAuthor")
    static let mangaContainsURL = searchAPI.appending(path: "mangasContains")
    static let loginUserURL = loginAPI.appending(path: "login")
    static let myCollectionURL = collectionAPI
}
