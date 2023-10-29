//
//  GridView.swift
//  Stefanini
//
//  Created by Matías Blum on 28/10/2023.
//

import SwiftUI

struct GridView: View {
    @Binding var catImages: [ImgurData]

    // Definir columnas para nuestra cuadrícula
    let columns = [
        GridItem(.flexible(), spacing: 4),  // Espacio mínimo entre imágenes
        GridItem(.flexible(), spacing: 4),
        GridItem(.flexible(), spacing: 4),
        GridItem(.flexible(), spacing: 4)
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 4) { // Reduce el espacio entre las celdas
                ForEach(catImages) { image in
                    CatImageCell(catImage: image)
                        .aspectRatio(contentMode: .fit)
                        .padding([.vertical], 4)
                }
            }
            .padding([.horizontal], 10)
        }
    }
}

/*
struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(catImages: .constant(dummyCatImages))
    }
    
    static let dummyCatImages: [CatImage] = [
        CatImage(id: "1", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "2", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "3", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "4", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "5", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "6", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "7", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "8", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "9", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "10", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "11", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "12", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "13", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "14", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "15", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "16", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "17", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "18", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "19", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "20", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "21", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "22", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "23", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "24", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "25", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "26", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "27", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "28", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "29", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "30", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "31", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "32", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "33", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "34", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "35", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "36", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "37", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "38", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "39", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "40", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "41", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "42", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "43", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "44", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "45", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "46", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "47", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "48", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "49", link: "https://i.imgur.com/T7SGEv8.jpg"),
        CatImage(id: "50", link: "https://i.imgur.com/T7SGEv8.jpg"),
    ]
}
*/
