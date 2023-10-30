//
//  CatImage.swift
//  Stefanini
//
//  Created by Matías Blum on 28/10/2023.
//

import Foundation

struct ImgurResponse: Codable {
    let data: [ImgurData]
}

struct ImgurData: Identifiable, Codable {
    let id: String
    let images: [ImageCats]?
}

struct ImageCats: Identifiable, Codable {
    let id: String
    let link: String
    let type: TypeEnum
}

enum TypeEnum: String, Codable {
    case imageJPEG = "image/jpeg"
    case imagePNG = "image/png"
    case videoMp4 = "video/mp4"
}
