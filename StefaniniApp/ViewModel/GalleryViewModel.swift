//
//  GalleryViewModel.swift
//  Stefanini
//
//  Created by Matías Blum on 28/10/2023.
//

// GalleryViewModel.swift

import SwiftUI

class GalleryViewModel: ObservableObject {

    @Published var catImages: [ImgurData] = []
    @Published var error: String? = nil

    init() {
        fetchCatImages()
    }

    func fetchCatImages() {
        APIManager.shared.fetchCatImages { [weak self] (images, error) in
            if let error = error {
                DispatchQueue.main.async {
                    self?.error = error.localizedDescription
                    print("error")
                }
            } else if let images = images {
                DispatchQueue.main.async {
                    self?.catImages = images
                    print("\(images)")
                }
            }
        }
    }
}



