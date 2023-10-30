//
//  CatImageCell.swift
//  Stefanini
//
//  Created by Matías Blum on 28/10/2023.
//

import SwiftUI

struct CatImageCell: View {
    let catImage: ImgurData
    
    var body: some View {
        ZStack {
            Color.white
                .frame(width: 80, height: 80)
                .cornerRadius(5)
                .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0, y: 2)
            if let firstImage = catImage.images?.first,
               let url = URL(string: firstImage.link) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(maxWidth: 70, maxHeight: 70)
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: 70, maxHeight: 70)
                    case .failure:
                        Image("Account")
                            .frame(maxWidth: 70, maxHeight: 70)
                    @unknown default:
                        Image("Account")
                            .frame(maxWidth: 70, maxHeight: 70)
                    }
                }
                .aspectRatio(contentMode: .fill)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 1)
                )
            }
            else {
                Image("Account")
                    .frame(maxWidth: 70, maxHeight: 70)
            }
        }
    }
}

struct CatImageCell_Previews: PreviewProvider {
    static var previews: some View {
        let sampleImage = ImageCats(id: "1", link: "https://i.imgur.com/OJWMJ4A.jpg", type: .imageJPEG)
        let sampleImgurData = ImgurData(id: "1", images: [sampleImage])

        CatImageCell(catImage: sampleImgurData)
            .previewLayout(.sizeThatFits)
            .padding(10)
    }
}

