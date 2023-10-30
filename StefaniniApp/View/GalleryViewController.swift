//
//  GalleryViewController.swift
//  Stefanini
//
//  Created by Matías Blum on 28/10/2023.
//

import SwiftUI

struct GalleryView: View {
    @ObservedObject var viewModel = GalleryViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let error = viewModel.error {
                    Text(error)
                        .foregroundColor(.red)
                } else {
                    GridView(catImages: $viewModel.catImages)
                }
            }
            .onAppear {
                viewModel.fetchCatImages()
            }
            .navigationBarTitle("Gallery")
            .navigationBarItems(trailing: Button(action: {
                viewModel.fetchCatImages()
            }) {
                Image(systemName: "arrow.clockwise")
            })
        }
    }
}

struct Preview: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}

