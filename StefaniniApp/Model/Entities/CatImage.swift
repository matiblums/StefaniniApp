//
//  CatImage.swift
//  Stefanini
//
//  Created by Matías Blum on 28/10/2023.
//

import Foundation

struct CatImage: Identifiable, Codable {
    var id: String
    var link: String
}

struct APIResponse: Codable {
    var data: [CatImage]
}

struct ImgurResponse: Codable {
    let data: [ImgurData]
}

struct ImgurData: Identifiable, Codable {
    let id: String
    let images: [ImageCats]
}

struct ImageCats: Identifiable, Codable {
    let id: String
    let link: String
}
