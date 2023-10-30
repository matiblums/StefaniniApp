//
//  GridView.swift
//  Stefanini
//
//  Created by Matías Blum on 28/10/2023.
//

import SwiftUI

struct GridView: View {
    @Binding var catImages: [ImgurData]

    let columns = [
        GridItem(.flexible(), spacing: 4),
        GridItem(.flexible(), spacing: 4),
        GridItem(.flexible(), spacing: 4),
        GridItem(.flexible(), spacing: 4)
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 4) {
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

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleImage1 = ImageCats(id: "1", link: "https://i.imgur.com/T7SGEv8.jpg", type: .imageJPEG)
        let sampleImage2 = ImageCats(id: "2", link: "https://i.imgur.com/T7SGEv8.jpg", type: .imageJPEG)
        
        let sampleImgurData1 = ImgurData(id: "1", images: [sampleImage1])
        let sampleImgurData2 = ImgurData(id: "2", images: [sampleImage2])

        let sampleDataArray: [ImgurData] = [sampleImgurData1, sampleImgurData2]

        GridView(catImages: .constant(sampleDataArray))
            .previewLayout(.sizeThatFits)
            .padding(10)
    }
}
