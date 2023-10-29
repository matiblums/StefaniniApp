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
                .frame(width: 80, height: 80) // Ajusta el tamaño del fondo según lo necesites
                .cornerRadius(5)
                .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0, y: 2)
            AsyncImage(url: URL(string: catImage.images.first!.link)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(maxWidth: 70, maxHeight: 70)
                case .success(let image):
                    image.resizable()
                        .frame(maxWidth: 70, maxHeight: 70)
                case .failure:
                    Image("Account")
                        .frame(maxWidth: 70, maxHeight: 70)
                @unknown default:
                    Image("Account")
                        .frame(maxWidth: 70, maxHeight: 70)
                }
            }
            .aspectRatio(contentMode: .fill) // Llena el espacio disponible manteniendo la relación de aspecto de la imagen
            .clipShape(RoundedRectangle(cornerRadius: 5)) // Recorta la vista con esquinas redondeadas
            .overlay( // Añade un borde alrededor de la vista
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.gray, lineWidth: 1)
            )
        }
    }
}


/*
struct CatImageCell_Previews: PreviewProvider {
    static var previews: some View {
        CatImageCell(catImage: CatImage(id: "2", link: "https://i.imgur.com/T7SGEv8.jpg"))
    }
}
*/
